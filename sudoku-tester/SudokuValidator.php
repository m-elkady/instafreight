<?php

class SudokuValidator
{
    public $rows = [];
    public $columns = [];
    public $blocks = [];

    /**
     * SudokuValidator constructor.
     * @param array $sudokuArr
     */
    public function __construct($sudokuArr = [])
    {
        $this->rows = $sudokuArr;
        $this->setData();
    }

    /**
     * @return void
     */
    private function setData(): void
    {
        for ($row = 0; $row < 9; $row++) {
            for ($column = 0; $column < 9; $column++) {
                $this->setColumns($row, $column);
                $this->setBlocks($row, $column);
            }
        }
    }

    /**
     * @param int $row
     * @param int $column
     */
    private function setColumns(int $row, int $column): void
    {
        $this->columns[$column][] = $this->rows[$row][$column];
    }

    /**
     * @param int $row
     * @param int $column
     */
    private function setBlocks($row, $column): void
    {
        $boxRow = floor($row / 3);
        $boxCol = floor($column / 3);
        $boxIndex = $boxRow * 3 + $boxCol;
        $this->blocks[$boxIndex][] = $this->rows[$row][$column];
    }

    /**
     * @return bool
     */
    public function validate(): bool
    {
        return $this->check($this->rows) && $this->check($this->columns) && $this->check($this->blocks);
    }

    /**
     * @param array $unit
     * @return bool
     */
    private function check(array $unit): bool
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