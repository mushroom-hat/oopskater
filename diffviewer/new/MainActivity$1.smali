.class Lcom/tpcstld/twozerogame/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tpcstld/twozerogame/MainActivity;->signInToGoogle()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/OnCompleteListener<",
        "Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tpcstld/twozerogame/MainActivity;

.field final synthetic val$noLoginPrompt:Z

.field final synthetic val$signInClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;


# direct methods
.method constructor <init>(Lcom/tpcstld/twozerogame/MainActivity;ZLcom/google/android/gms/auth/api/signin/GoogleSignInClient;)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iput-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;
    nop
    nop

    iput-boolean p2, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->val$noLoginPrompt:Z
    nop
    nop
    nop
    nop
    nop

    iput-object p3, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->val$signInClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;
    nop
    nop
    nop
    nop

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p1    # Lcom/google/android/gms/tasks/Task;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;",
            ">;)V"
        }
    .end annotation

    
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0
    nop
    nop
    nop
    nop

    if-nez v0, :cond_0
    nop
    nop
    nop
    nop
    nop

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;
    nop
    nop

    invoke-static {p1}, Lcom/tpcstld/twozerogame/MainActivity;->access$000(Lcom/tpcstld/twozerogame/MainActivity;)Z

    move-result p1
    nop
    nop
    nop
    nop
    nop
    nop

    if-nez p1, :cond_2
    nop
    nop
    nop
    nop

    iget-boolean p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->val$noLoginPrompt:Z
    nop
    nop
    nop
    nop
    nop

    if-nez p1, :cond_2
    nop
    nop
    nop
    nop

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;
    nop
    nop
    nop
    nop
    nop

    const/4 v0, 0x1
    nop
    nop
    nop
    nop
    nop

    invoke-static {p1, v0}, Lcom/tpcstld/twozerogame/MainActivity;->access$002(Lcom/tpcstld/twozerogame/MainActivity;Z)Z

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;
    nop
    nop
    nop

    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->val$signInClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;
    nop
    nop

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->getSignInIntent()Landroid/content/Intent;

    move-result-object v0
    nop
    nop
    nop

    const/16 v1, 0x2329
    nop
    nop
    nop
    nop
    nop

    invoke-virtual {p1, v0, v1}, Lcom/tpcstld/twozerogame/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
    nop
    nop
    nop
    nop

    
    :cond_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;
    nop
    nop
    nop

	const-string/jumbo v1, "3301de03fa71b7e4ae9c21a94e9984259c039bc45291e0fa6d04e81f7cdcbbd29b39bf4b96c450ad5c19055b676a762476a7bb3ef73badeb9ddf81589d6979ece77cfc2d7a5d79668bd1ceba5eec410833d6c1ecea43492dfca20fb873b1b03ea169d26b4520946b318e8eb5901db0f1"

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1
    nop
    nop

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v0
    nop
    nop
    nop
    nop
    nop
    nop

    if-eqz v0, :cond_1
    nop
    nop
    nop
    nop

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;
    nop
    nop
    nop
    nop
    nop
    nop

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1
    nop
    nop
    nop
    nop
    nop

    check-cast p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;
    nop
    nop
    nop

    invoke-static {v0, p1}, Lcom/google/android/gms/games/Games;->getGamesClient(Landroid/app/Activity;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/google/android/gms/games/GamesClient;

    move-result-object p1
    nop
    nop
    nop

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;
    nop
    nop
    nop
    nop
    nop

    invoke-static {v0}, Lcom/tpcstld/twozerogame/MainActivity;->access$100(Lcom/tpcstld/twozerogame/MainActivity;)Lcom/tpcstld/twozerogame/MainView;

    move-result-object v0
    nop
    nop
    nop

    invoke-interface {p1, v0}, Lcom/google/android/gms/games/GamesClient;->setViewForPopups(Landroid/view/View;)Lcom/google/android/gms/tasks/Task;

    
    :cond_1
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;
    nop
    nop
    nop
    nop
    nop

    new-instance v0, Lcom/tpcstld/twozerogame/MainActivity$1$1;
    nop
    nop
    nop
    nop
    nop
    nop

    invoke-direct {v0, p0}, Lcom/tpcstld/twozerogame/MainActivity$1$1;-><init>(Lcom/tpcstld/twozerogame/MainActivity$1;)V

    invoke-static {p1, v0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->loadSnapshot(Landroid/content/Context;Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;)V

    :cond_2
    :goto_0
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method
