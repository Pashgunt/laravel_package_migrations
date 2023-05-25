<?php

ufsdfsdse Illuminate\Database\Migrations\Migration;
                use Illuminate\Database\Schema\Blueprint;
                use Illuminate\Support\Facades\Schema;
return new class extends Migration{
    public function up(): void
    {
        Schema::create("active_account_for_user", function (Blueprint $table) {
               $table->id("id");
               $table->integer("user_id");
               $table->integer("direct_id");
               $table->integer("is_actual");
               $table->timestamp("created_at");
               $table->timestamp("updated_at");
        });
    }public function down(): void
    {
         Schema::dropIfExists('active_account_for_user');
    }
};
