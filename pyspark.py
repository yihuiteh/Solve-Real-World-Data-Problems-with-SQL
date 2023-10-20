You can start a new SparkSession with the getOrCreate() function from SparkSession’s builder.

--start a SparkSession and assign it the name spark
--confirm your session is built

from pyspark.sql import SparkSession
spark = SparkSession.builder.getOrCreate()
print(spark)

-- use the parallelize() function to transform a local dataset into an RDD
-- sparkContext within a SparkSession is the connection to the cluster and gives us the ability to create and transform RDDs

student_rdd = spark.sparkContext.parallelize(student_data,5)
OR 
rdd_txt = spark.sparkContext.textFile("file_name.txt", 10)

-- verify getNumPartitions() to check the number of partitions for an RDD.
student_rdd.getNumPartitions()
