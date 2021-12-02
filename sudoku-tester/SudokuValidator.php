<?php

class SudokuValidator
{
    public $rows = [];
    public $columns = [];
    public $blocks = [];

    public function __construct($sudokuArr = [])
    {
        $this->rows = $sudokuArr;
        $this->setData();
    }

    private function setData()
    {
        for ($row = 0; $row < 9; $row++) {
            for ($column = 0; $column < 9; $column++) {
                $this->setColumns($row, $column);
                $this->setBlocks($row, $column);
            }
        }
    }

    private function setColumns($row, $column)
    {
        $this->columns[$column][] = $this->rows[$row][$column];
    }

    private function setBlocks($row, $column)
    {
        $boxRow = floor($row / 3);
        $boxCol = floor($column / 3);
        $boxIndex = $boxRow * 3 + $boxCol;
        $this->blocks[$boxIndex][] = $this->rows[$row][$column];
    }

    public function validate()
    {
        return $this->check($this->rows) && $this->check($this->columns) && $this->check($this->blocks);
    }

    private function check($unit)
    {
        for ($i = 0; $i < 9; $i++) {
            sort($unit[$i]);

            for ($j = 0; $j < 9; $j++) {
                if ($unit[$i][$j] !== $j + 1) {
                    return false;
                }
            }
        }
        return true;
    }

}