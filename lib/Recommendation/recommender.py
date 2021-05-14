import pandas as pd
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity



features = ["course_title","platform","level"]

def combine_features(row):
    return row['course_title']+" "+row['platform']+" "+row['level']


for feature in features:
    df[feature] = df[feature].fillna('') #filling all NaNs with blank string

df["combined_features"] = df.apply(combine_features,axis=1)
#applying combined_features() method over each rows of dataframe and storing the combined string in "combined_features" column

cv = CountVectorizer() #creating new CountVectorizer() object
count_matrix = cv.fit_transform(df["combined_features"]) #feeding combined strings(movie contents) to CountVectorizer() object

cosine_sim = cosine_similarity(count_matrix) #cosine similarity matrix for count matrix

#functions to get course title from course index and vice-versa.

def get_title_from_index(index):
    return df[df.index == index]["course_title"].values[0]
def get_index_from_title(title):
    return df[df.course_title == title]["index"].values[0]

course_user_likes = "Ultimate Investment Banking Course" # here take the inputs of user
course_index = get_index_from_title(course_user_likes)
similar_courses = list(enumerate(cosine_sim[course_index])) #accessing the row corresponding to given course to find all the similarity scores for that course and then enumerating over it

sorted_similar_courses = sorted(similar_courses,key=lambda x:x[1],reverse=True)[1:]

i=0
print("Top 5 similar courses to "+course_user_likes+" are:\n")
for element in sorted_similar_courses:
    print(get_title_from_index(element[0]))
    i=i+1
    if i>5:
        break