<?php

ufsdfsdse Illuminate\Database\Migrations\Migration;
                use Illuminate\Database\Schema\Blueprint;
                use Illuminate\Support\Facades\Schema;
return new class extends Migration{
    public function up(): void
    {
        Schema::create("oauth_refresh_tokens", function (Blueprint $table) {
               $table->id("id");
               $table->string("access_token_id", 100);
               $table->tinyInteger("revoked", 1);
               $table->dateTime("expires_at");
        });
    }public function down(): void
    {
         Schema::dropIfExists('oauth_refresh_tokens');
    }
};
