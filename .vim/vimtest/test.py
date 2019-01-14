
#!/usr/bin/env python
# coding=utf-8
# ****************************************************
#
#      Filename: test.py
#
#        Author: ly - liyang.ok@outlook.com
#        Create: 2018-12-02 12:20:49
# Last Modified: 2018-12-03 20:52:41
#   Description: ---
#
# ***************************************************

import tensorflow as tf
import sys
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

mnist = tf.keras.datasets.mnist

(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0

model = tf.keras.models.Sequential([
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dense(512, activation=tf.nn.relu),
    tf.keras.layers.Dropout(0.2),
    tf.keras.layers.Dense(10, activation=tf.nn.softmax)
])
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

model.fit(x_train, y_train, epochs=5)
model.evaluate(x_test, y_test)

model.add()


