.class public Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
.super Ljava/lang/Object;
.source "SnapshotData.java"


# static fields
.field private static f52bfda51:J = 0x1L

.field private static f52bfda51JkkaBaky:J = 0x1L

.field private static f52bfda51pZrONIfE:J = 0x1L

.field private static f52bfda51nUxnwDwY:J = 0x1L


# instance fields
.field private fb1e0e9e7:J

.field private fb1e0e9e7CCeIrVPw:J

.field private fb1e0e9e7oZjswOUf:J

.field private fb1e0e9e7QitwLovV:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public constructor <init>(J)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    
    iput-wide p1, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->fb1e0e9e7:J
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public static deserialize(Lcom/google/android/gms/games/snapshot/Snapshot;)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    
    :try_start_0
    invoke-interface {p0}, Lcom/google/android/gms/games/snapshot/Snapshot;->getSnapshotContents()Lcom/google/android/gms/games/snapshot/SnapshotContents;

    move-result-object p0
    nop
    nop

    invoke-interface {p0}, Lcom/google/android/gms/games/snapshot/SnapshotContents;->readFully()[B

    move-result-object p0
    nop

    
    invoke-static {p0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->deserialize([B)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    move-result-object p0
    nop
    nop
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0
    nop

    :catch_0
    const/4 p0, 0x0
    nop

    return-object p0
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public static deserialize([B)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    .locals 3

	goto/32 :after_last_instruction

	:before_first_instruction
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    
    new-instance v0, Ljava/lang/String;
    nop
    nop
    nop

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

	const-string/jumbo p0, "ed21760e48415b1df74dbdfdbbd68ca6"

	invoke-static {p0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object p0
    nop

    invoke-virtual {v0, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0
    nop

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0
    nop

    const/4 v0, 0x0
    nop
    nop

    
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0
    nop
    nop

    check-cast v0, Ljava/lang/String;
    nop
    nop

    sget-wide v1, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->f52bfda51:J
    nop
    nop
    nop

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1
    nop

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    nop
    nop
    nop

    if-nez v0, :cond_0
    nop
    nop

    const/4 p0, 0x0
    nop
    nop

    return-object p0
    nop

    
    :cond_0
    new-instance v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    nop
    nop
    nop

    const/4 v1, 0x1
    nop
    nop

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0
    nop
    nop
    nop

    check-cast p0, Ljava/lang/String;
    nop
    nop
    nop

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    nop

    invoke-direct {v0, v1, v2}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;-><init>(J)V

    return-object v0
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public getHighScore()J
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->fb1e0e9e7:J
    nop
    nop

    return-wide v0
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public serialize()[B
    .locals 3

	goto/32 :after_last_instruction

	:before_first_instruction

    
    new-instance v0, Ljava/lang/StringBuilder;
    nop
    nop

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-wide v1, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->f52bfda51:J
    nop
    nop

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

	const-string/jumbo v1, "ed21760e48415b1df74dbdfdbbd68ca6"

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1
    nop
    nop
    nop

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->fb1e0e9e7:J
    nop

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    nop

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0
    nop

    return-object v0
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
