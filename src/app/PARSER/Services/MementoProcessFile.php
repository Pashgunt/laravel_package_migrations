<?php

namespace Migrations\Parser\App\PARSER\Services;

use Migrations\Parser\App\PARSER\Contracts\MementoInterface;

class MementoProcessFile implements MementoInterface
{
    private array $state;
    private string $date;

    public function __construct(array $state)
    {
        $this->state = $state;
        $this->date = date('Y-m-d H:i:s');
    }

    public function getState(): array
    {
        return $this->state;
    }

    public function getDate(): string
    {
        return $this->date;
    }
}
