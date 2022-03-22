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

    .line 173
    iput-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;

    iput-boolean p2, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->val$noLoginPrompt:Z

    iput-object p3, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->val$signInClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 2
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

    .line 176
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_0

    .line 177
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;

    invoke-static {p1}, Lcom/tpcstld/twozerogame/MainActivity;->access$000(Lcom/tpcstld/twozerogame/MainActivity;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-boolean p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->val$noLoginPrompt:Z

    if-nez p1, :cond_2

    .line 178
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/tpcstld/twozerogame/MainActivity;->access$002(Lcom/tpcstld/twozerogame/MainActivity;Z)Z

    .line 179
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;

    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->val$signInClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->getSignInIntent()Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x2329

    invoke-virtual {p1, v0, v1}, Lcom/tpcstld/twozerogame/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 182
    :cond_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Successfully logged into Google."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 184
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 185
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    invoke-static {v0, p1}, Lcom/google/android/gms/games/Games;->getGamesClient(Landroid/app/Activity;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/google/android/gms/games/GamesClient;

    move-result-object p1

    .line 186
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;

    invoke-static {v0}, Lcom/tpcstld/twozerogame/MainActivity;->access$100(Lcom/tpcstld/twozerogame/MainActivity;)Lcom/tpcstld/twozerogame/MainView;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/google/android/gms/games/GamesClient;->setViewForPopups(Landroid/view/View;)Lcom/google/android/gms/tasks/Task;

    .line 189
    :cond_1
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;

    new-instance v0, Lcom/tpcstld/twozerogame/MainActivity$1$1;

    invoke-direct {v0, p0}, Lcom/tpcstld/twozerogame/MainActivity$1$1;-><init>(Lcom/tpcstld/twozerogame/MainActivity$1;)V

    invoke-static {p1, v0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->loadSnapshot(Landroid/content/Context;Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;)V

    :cond_2
    :goto_0
    return-void
.end method
