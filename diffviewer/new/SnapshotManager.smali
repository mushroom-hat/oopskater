.class public Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;
.super Ljava/lang/Object;
.source "SnapshotManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;
    }
.end annotation


# static fields
.field private static final f46d1ca4b:Ljava/lang/String;

.field private static final f46d1ca4bSkpyvZAp:Ljava/lang/String;

.field private static final f46d1ca4bftIyyMyx:Ljava/lang/String;

.field private static final f46d1ca4bNjMfbEOx:Ljava/lang/String;

.field private static final f4fa9034e:Ljava/lang/String;

.field private static final f4fa9034eoOZjZOFg:Ljava/lang/String;

.field private static final f4fa9034etpYviVDA:Ljava/lang/String;

.field private static final f4fa9034eoViGWOkx:Ljava/lang/String;

.field private static f3beb8fce:Lcom/tpcstld/twozerogame/snapshot/SnapshotData; = null

.field private static f3beb8fceAGwAUXlL:Lcom/tpcstld/twozerogame/snapshot/SnapshotData; = null

.field private static f3beb8fceLDkVQgXZ:Lcom/tpcstld/twozerogame/snapshot/SnapshotData; = null

.field private static f5c1197fb:Z = false

.field private static f5c1197fbrNITViDQ:Z = false


# direct methods
.method static constructor <clinit>()V
	.locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

	const-string/jumbo v0, "a50875bdd27b624f11dd44ae043d4e229ebddae4bf41eb9735e8189326416845"

	invoke-static {v0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v0

	sput-object v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->f46d1ca4b:Ljava/lang/String;

	const-string/jumbo v0, "d7d8158782f01de0235195a224b3b687"

	invoke-static {v0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v0

	sput-object v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->f4fa9034e:Ljava/lang/String;

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public constructor <init>()V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method static synthetic access$000(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/games/snapshot/Snapshot;
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-static {p0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->getSnapshotFromTask(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/games/snapshot/Snapshot;

    move-result-object p0
    nop
    nop
    nop

    return-object p0
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method static synthetic access$102(Z)Z
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    sput-boolean p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->f5c1197fb:Z
    nop
    nop
    nop

    return p0
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method static synthetic access$200()Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    sget-object v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->f3beb8fce:Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    nop
    nop
    nop

    return-object v0
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private static getSnapshotFromTask(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/games/snapshot/Snapshot;
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/gms/games/SnapshotsClient$DataOrConflict<",
            "Lcom/google/android/gms/games/snapshot/Snapshot;",
            ">;>;)",
            "Lcom/google/android/gms/games/snapshot/Snapshot;"
        }
    .end annotation

    
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0
    nop
    nop
    nop

    const/4 v1, 0x0
    nop
    nop

    if-nez v0, :cond_0
    nop
    nop

    return-object v1
    nop

    
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v0
    nop
    nop
    nop

    if-nez v0, :cond_1
    nop
    nop
    nop

    return-object v1
    nop
    nop

    
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p0
    nop

    check-cast p0, Lcom/google/android/gms/games/SnapshotsClient$DataOrConflict;
    nop

    invoke-virtual {p0}, Lcom/google/android/gms/games/SnapshotsClient$DataOrConflict;->getData()Ljava/lang/Object;

    move-result-object p0
    nop

    check-cast p0, Lcom/google/android/gms/games/snapshot/Snapshot;
    nop
    nop

    return-object p0
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public static loadSnapshot(Landroid/content/Context;Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;)V
    .locals 3

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-static {p0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v0
    nop

    if-eqz v0, :cond_0
    nop

    
    invoke-static {p0, v0}, Lcom/google/android/gms/games/Games;->getSnapshotsClient(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/google/android/gms/games/SnapshotsClient;

    move-result-object p0
    nop
    nop
    nop

    const/4 v0, 0x1
    nop
    nop
    nop

    const/4 v1, 0x4
    nop

	const-string/jumbo v2, "d7d8158782f01de0235195a224b3b687"

	invoke-static {v2}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v2
    nop
    nop
    nop

    
    invoke-interface {p0, v2, v0, v1}, Lcom/google/android/gms/games/SnapshotsClient;->open(Ljava/lang/String;ZI)Lcom/google/android/gms/tasks/Task;

    move-result-object p0
    nop

    new-instance v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$1;
    nop
    nop
    nop

    invoke-direct {v0, p1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$1;-><init>(Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;)V

    
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    :cond_0
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public static saveSnapshot(Landroid/content/Context;Lcom/tpcstld/twozerogame/snapshot/SnapshotData;)V
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    
    sput-object p1, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->f3beb8fce:Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    nop

    
    invoke-static {p0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object p1
    nop
    nop

    if-eqz p1, :cond_1
    nop
    nop
    nop

    
    sget-boolean v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->f5c1197fb:Z
    nop

    if-eqz v0, :cond_0
    nop

    return-void

    :cond_0
    const/4 v0, 0x1
    nop
    nop
    nop

    
    sput-boolean v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->f5c1197fb:Z
    nop
    nop
    nop

    
    invoke-static {p0, p1}, Lcom/google/android/gms/games/Games;->getSnapshotsClient(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/google/android/gms/games/SnapshotsClient;

    move-result-object p0
    nop
    nop
    nop

    const/4 p1, 0x4
    nop
    nop
    nop

	const-string/jumbo v1, "d7d8158782f01de0235195a224b3b687"

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1
    nop

    
    invoke-interface {p0, v1, v0, p1}, Lcom/google/android/gms/games/SnapshotsClient;->open(Ljava/lang/String;ZI)Lcom/google/android/gms/tasks/Task;

    move-result-object p1
    nop

    new-instance v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$2;
    nop
    nop
    nop

    invoke-direct {v0, p0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$2;-><init>(Lcom/google/android/gms/games/SnapshotsClient;)V

    
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    :cond_1
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
