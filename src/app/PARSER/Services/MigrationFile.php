<?php

namespace Migrations\Parser\App\PARSER\Services;

use Closure;
use Migrations\Parser\App\Jobs\CreateMigrationJob;
use Migrations\Parser\App\PARSER\Contracts\MementoInterface;
use Migrations\Parser\App\PARSER\Contracts\ProcessPiplineInterface;

class MigrationFile extends RulesDump implements ProcessPiplineInterface
{
    private array $state = [];

    public function process(array $data, Closure $next): array
    {
        (new CreateMigrationJob($data))->handle();
        return $next($data);
    }

    public function save(): MementoInterface
    {
        return new MementoProcessFile($this->state);
    }
    public function restore(MementoProcessFile $mementoProcess): void
    {
        $this->state = $mementoProcess->getState();
    }
}
