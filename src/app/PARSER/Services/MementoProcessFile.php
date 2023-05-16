<?php

namespace Migrations\Parser\App\PARSER\Services;

use Migrations\Parser\App\PARSER\Contracts\MementoInterface;

class MementoProcessFile implements MementoInterface
{
    private string $state;
    private string $date;

    public function __construct(string $state)
    {
        $this->state = $state;
        $this->date = date('Y-m-d H:i:s');
    }

    public function getState(): string
    {
        return $this->state;
    }

    public function getDate(): string
    {
        return $this->date;
    }
}
