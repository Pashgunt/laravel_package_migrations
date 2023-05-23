<?php

namespace Migrations\Parser\App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Artisan;

class CreateMigrationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private static array $tables = [];

    public function __construct(array $tables)
    {
        self::$tables = $tables;
    }

    public function handle(): void
    {
        Artisan::call('migration:generate', [
            'tables' => CreateMigrationJob::$tables,
        ]);
    }
}
