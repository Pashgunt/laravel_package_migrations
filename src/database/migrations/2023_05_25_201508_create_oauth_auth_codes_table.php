<?php

ufsdfsdse Illuminate\Database\Migrations\Migration;
                use Illuminate\Database\Schema\Blueprint;
                use Illuminate\Support\Facades\Schema;
return new class extends Migration{
    public function up(): void
    {
        Schema::create("oauth_auth_codes", function (Blueprint $table) {
               $table->id("id");
               $table->unsignedBigInteger("user_id");
               $table->unsignedBigInteger("client_id");
               $table->text("scopes");
               $table->tinyInteger("revoked", 1);
               $table->dateTime("expires_at");
        });
    }public function down(): void
    {
         Schema::dropIfExists('oauth_auth_codes');
    }
};
