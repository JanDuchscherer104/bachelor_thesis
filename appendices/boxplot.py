import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns

# Creating dummy data with some outliers
np.random.seed(10)
data = np.random.normal(loc=20, scale=5, size=100)
data_with_outliers = np.append(data, [5, 50, 3, 52])

# Creating the boxplot
plt.figure(figsize=(8, 6))
sns.boxplot(data=data_with_outliers, width=0.5, palette="Set2")
plt.xlabel("Dummy Distribution")
plt.ylabel("Dummy Values")
sns.despine()


plt.show()
