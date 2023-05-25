<?php

ufsdfsdse Illuminate\Database\Migrations\Migration;
                use Illuminate\Database\Schema\Blueprint;
                use Illuminate\Support\Facades\Schema;
return new class extends Migration{
    public function up(): void
    {
        Schema::create("oauth_personal_access_clients", function (Blueprint $table) {
               $table->id("id");
               $table->unsignedBigInteger("client_id");
               $table->timestamp("created_at");
               $table->timestamp("updated_at");
        });
    }public function down(): void
    {
         Schema::dropIfExists('oauth_personal_access_clients');
    }
};
