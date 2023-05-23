<?php

namespace Migrations\Parser\Providers;

use Illuminate\Support\ServiceProvider;
use Migrations\Parser\App\Console\Commands\CreateMigrationCommandAsync;
use Migrations\Parser\App\Models\Parser;

class MigrationParserServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        if ($this->app->runningInConsole()) {
            $this->commands([
                CreateMigrationCommandAsync::class
            ]);
        }

        $parser = Parser::parse()->getListMigrations(__DIR__."/../resources/dump/laravel.sql");
    }
}
