<?php

namespace Migrations\Parser\Providers;

use Illuminate\Support\ServiceProvider;
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
        $parser = Parser::parse()->getTableList(__DIR__."/../resources/dump/laravel.sql");
        dd($parser);
    }
}
