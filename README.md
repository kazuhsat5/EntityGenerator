# Entity Generator
Simple PHP Setter/Getter Generator
## 使い方
```
$ ruby entity_generator.rb [var_file_path]
```
* thor gemのインストール
```
$ gem install thor
```
（参考）https://github.com/erikhuda/thor
## 例
1.変数名ファイルを用意
```
# vars
test
testVar
```
2.実行
```
$ ./entity -f vars
```
3.変数名ファイルと同ディレクトリに「変数名ファイル名.php」が出力される
```
# vars.php
<?php

namespace Namespace;

class Entity
{
    private $_test;
    private $_testVar;

    public function setTest($test)
    {
        $this->_test = $test;
    }

    public function setTestVar($testVar)
    {
        $this->_testVar = $testVar;
    }

    public function getTest($test)
    {
        return $this->_test;
    }

    public function getTestVar($testVar)
    {
        return $this->_testVar;
    }
}
```
