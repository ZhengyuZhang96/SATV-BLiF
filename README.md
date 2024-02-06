# SATV-BLiF

The code of our proposed SATV-BLiF metric in ICIP2023 paper "Blind Quality Assessment of Light Field Image Based on Spatio-Angular Textural Variation". Please refer to our [paper](https://ieeexplore.ieee.org/abstract/document/10222216) for details.

### Run demo
To run the demo code, please download "EPICNN_dishes.bmp" on [Baidu drive](https://pan.baidu.com/s/144q5dzCa-_1KMhr9qi01cQ) (code: INSA), put it into "./demo/..." and run:
```
  $ run_demo.m
```

### Generate features   
Please set the path to the database in "./Databases/get_info_from_database.m" and the database name in "get_SATV_BLiF_features_from_database.m" and run:
```
  $ get_SATV_BLiF_features_from_database.m
```

### Report performance 
Please run:
```
  $ Report_Result_Win5.m
  $ Report_Result_NBU.m
  $ Report_Result_SHU.m
```

## Contact
Welcome to raise issues or email to [zhengyu.zhang@insa-rennes.fr](zhengyu.zhang@insa-rennes.fr) for any question.
