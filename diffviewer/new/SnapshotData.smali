.class public Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
.super Ljava/lang/Object;
.source "SnapshotData.java"


# static fields
.field private static f21f43ed0:J = 0x1L

.field private static f21f43ed0vhBqUkcX:J = 0x1L

.field private static f21f43ed0CuLdrNAR:J = 0x1L

.field private static fe6fc9ef1:J = 0x1L

.field private static fe6fc9ef1mzIAvBsk:J = 0x1L

.field private static fe736b2cb:J = 0x1L

.field private static fe736b2cbApsXsXfd:J = 0x1L

.field private static fe200786e:J = 0x1L

.field private static fe200786earCrxaje:J = 0x1L

.field private static fe200786eyDZboZtd:J = 0x1L


# instance fields
.field private fe94f9274:J

.field private fe94f9274GFZNbyWG:J

.field private fe94f9274wwLIDFeQ:J

.field private fe94f9274jhSqyyYf:J

.field private f27d7d772:J

.field private f27d7d772iYIzOWzv:J

.field private fd24d72a1:J

.field private fd24d72a1tVIXpyBn:J

.field private fd24d72a1magISurs:J

.field private fd24d72a1ODMUkwxN:J

.field private f65cffdb2:J

.field private f65cffdb2iWJaUYyW:J

.field private f65cffdb2YRHUcGdD:J

.field private f65cffdb2IvjVtHxr:J

.field private f65cffdb2gFNvZdjH:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public constructor <init>(J)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    
    iput-wide p1, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->fe94f9274:J
    nop
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public static deserialize(Lcom/google/android/gms/games/snapshot/Snapshot;)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    
    :try_start_0
    invoke-interface {p0}, Lcom/google/android/gms/games/snapshot/Snapshot;->getSnapshotContents()Lcom/google/android/gms/games/snapshot/SnapshotContents;

    move-result-object p0
    nop
    nop
    nop
    nop

    invoke-interface {p0}, Lcom/google/android/gms/games/snapshot/SnapshotContents;->readFully()[B

    move-result-object p0
    nop
    nop

    
    invoke-static {p0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->deserialize([B)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    move-result-object p0
    nop
    nop
    nop
    nop
    nop
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0
    nop
    nop

    :catch_0
    const/4 p0, 0x0
    nop
    nop

    return-object p0
    nop
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public static deserialize([B)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    .locals 3

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    
    new-instance v0, Ljava/lang/String;
    nop
    nop
    nop
    nop

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

	const-string/jumbo p0, "441e88954096c8109245bd100f2688df201e9b78c7c63716e671d7566d826ea7a169d26b4520946b318e8eb5901db0f1"

	invoke-static {p0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object p0

	invoke-static {p0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object p0
    nop

    invoke-virtual {v0, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0
    nop
    nop

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0
    nop
    nop

    const/4 v0, 0x0
    nop
    nop
    nop
    nop
    nop

    
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0
    nop
    nop
    nop
    nop

    check-cast v0, Ljava/lang/String;
    nop
    nop
    nop
    nop
    nop

    sget-wide v1, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->f21f43ed0:J
    nop
    nop
    nop
    nop
    nop

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1
    nop
    nop
    nop
    nop

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

    const/4 p0, 0x0
    nop
    nop
    nop
    nop
    nop

    return-object p0
    nop
    nop
    nop

    
    :cond_0
    new-instance v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    nop
    nop
    nop
    nop

    const/4 v1, 0x1
    nop
    nop
    nop

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0
    nop
    nop
    nop
    nop
    nop

    check-cast p0, Ljava/lang/String;
    nop
    nop
    nop
    nop

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    nop
    nop

    invoke-direct {v0, v1, v2}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;-><init>(J)V

    return-object v0
    nop
    nop
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public getHighScore()J
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->fe94f9274:J
    nop
    nop
    nop

    return-wide v0
    nop
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public serialize()[B
    .locals 3

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    new-instance v0, Ljava/lang/StringBuilder;
    nop
    nop
    nop
    nop

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-wide v1, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->f21f43ed0:J
    nop
    nop
    nop

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

	const-string/jumbo v1, "441e88954096c8109245bd100f2688df201e9b78c7c63716e671d7566d826ea7a169d26b4520946b318e8eb5901db0f1"

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1
    nop
    nop
    nop

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->fe94f9274:J
    nop
    nop

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    nop
    nop

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0
    nop
    nop
    nop

    return-object v0
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method
