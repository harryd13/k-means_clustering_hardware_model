import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
# %matplotlib inline

df = pd.DataFrame({
    'x': [12, 20, 28, 18, 29, 33, 24, 45, 45, 52, 51, 52, 55, 53, 55, 61, 64, 69, 72],
    'y': [39, 36, 30, 52, 54, 46, 55, 59, 63, 70, 66, 63, 58, 23, 14, 8, 19, 7, 24]
})

# checkpoint1 ---- ---- x and y coordinates
np.random.seed(200)
k = 3
centroids = {
    
    i+1: [np.random.randint(0, 80), np.random.randint(0, 80)]
    for i in range(k)
}
# checkpointt2 ---- ---- centroids is a dictionary {1: [26, 16], 2: [68, 42], 3: [55, 76]}
    
fig = plt.figure(figsize=(5, 5))
plt.scatter(df['x'], df['y'], color='k')
colmap = {1: 'r', 2: 'g', 3: 'b'}
for i in centroids.keys():
    plt.scatter(*centroids[i], color=colmap[i])
plt.xlim(0, 80)
plt.ylim(0, 80)
plt.show()
print("centroids initialized...")

import sub32 as minus
import add32 as adde
import mul32 as mlpy

def assignment(df, centroids):
    df['x1'] = np.array(list(map(int,df['x']*100)))
    df['y1'] = np.array(list(map(int,df['y']*100)))
    centroids_int = {
    
        i+1:[0, 0]
        for i in range(k)
    }
    for i in centroids.keys():
        centroids_int[i][0]  = int(centroids[i][0]*100)
        centroids_int[i][1]  = int(centroids[i][1]*100)
        list_sqrt = []
        # sqrt((x1 - x2)^2 - (y1 - y2)^2)
        for j in range(len(df['x'])):
            y = minus.subtract(str(df['x1'][j]),str(centroids_int[i][0])) 
            z = minus.subtract(str(df['y1'][j]),str(centroids_int[i][1]))
            y_sq = mlpy.mul(str(y),str(y))
            z_sq = mlpy.mul(str(z),str(z))
            ans = adde.add(str(y_sq),str(z_sq))
            list_sqrt.append(ans/10000)
        df['distance_from_{}'.format(i)] = (
            np.sqrt(list_sqrt)
        )
    centroid_distance_cols = ['distance_from_{}'.format(i) for i in centroids.keys()]
#   print(centroid_distance_cols)
    df['closest'] = df.loc[:, centroid_distance_cols].idxmin(axis=1)
    # print(df['closest'])
    df['closest'] = df['closest'].map(lambda x: int(x.lstrip('distance_from_')))
    # print(df['closest'])
    df['color'] = df['closest'].map(lambda x: colmap[x])
    return df

df = assignment(df, centroids)
print("function called...once")
# print(df.head())
fig = plt.figure(figsize=(5, 5))
plt.scatter(df['x'], df['y'], color=df['color'], alpha=0.5, edgecolor='k')
for i in centroids.keys():
    plt.scatter(*centroids[i], color=colmap[i])
plt.xlim(0, 80)
plt.ylim(0, 80)
plt.show()
print("second ver...")

import copy

old_centroids = copy.deepcopy(centroids)
# print(centroids)

def update(k):
    for i in centroids.keys():
        centroids[i][0] = np.mean(df[df['closest'] == i]['x'])
        centroids[i][1] = np.mean(df[df['closest'] == i]['y'])
    return k

centroids = update(centroids)
print("centroids updated...")
    
fig = plt.figure(figsize=(5, 5))
ax = plt.axes()
plt.scatter(df['x'], df['y'], color=df['color'], alpha=0.5, edgecolor='k')
for i in centroids.keys():
    plt.scatter(*centroids[i], color=colmap[i])
plt.xlim(0, 80)
plt.ylim(0, 80)
for i in old_centroids.keys():
    old_x = old_centroids[i][0]
    old_y = old_centroids[i][1]
    dx = (centroids[i][0] - old_centroids[i][0]) * 0.75
    dy = (centroids[i][1] - old_centroids[i][1]) * 0.75
    ax.arrow(old_x, old_y, dx, dy, head_width=2, head_length=3, fc=colmap[i], ec=colmap[i])
plt.show()

df = assignment(df, centroids)

# Plot results
fig = plt.figure(figsize=(5, 5))
plt.scatter(df['x'], df['y'], color=df['color'], alpha=0.5, edgecolor='k')
for i in centroids.keys():
    plt.scatter(*centroids[i], color=colmap[i])
plt.xlim(0, 80)
plt.ylim(0, 80)
plt.show()

# Continue until all assigned categories don't change any more
print("while loop initialized...")
while True:
    closest_centroids = df['closest'].copy(deep=True)
    centroids = update(centroids)
    df = assignment(df, centroids)
    if closest_centroids.equals(df['closest']):
        break

fig = plt.figure(figsize=(5, 5))
plt.scatter(df['x'], df['y'], color=df['color'], alpha=0.5, edgecolor='k')
for i in centroids.keys():
    plt.scatter(*centroids[i], color=colmap[i])
plt.xlim(0, 80)
plt.ylim(0, 80)
plt.show()