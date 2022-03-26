.class public Lcom/tpcstld/twozerogame/AnimationGrid;
.super Ljava/lang/Object;
.source "AnimationGrid.java"


# instance fields
.field private f11680695:I

.field private f11680695uWzAZSZb:I

.field private f11680695VfGdUdhb:I

.field private f11680695xngxJQgU:I

.field private final f06e3d36f:[[Ljava/util/ArrayList;

.field private final f06e3d36fhekrpXdz:[[Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[[",
            "Ljava/util/ArrayList<",
            "Lcom/tpcstld/twozerogame/AnimationCell;",
            ">;"
        }
    .end annotation
.end field

.field public final f28d74d2b:Ljava/util/ArrayList;

.field public final f28d74d2bKlOWRfqy:Ljava/util/ArrayList;

.field public final f28d74d2bwyiZxQwR:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tpcstld/twozerogame/AnimationCell;",
            ">;"
        }
    .end annotation
.end field

.field private fcde09297:Z

.field private fcde09297GYNJNyOA:Z

.field private fcde09297GikDwEnT:Z

.field private fcde09297qFcCGdbW:Z

.field private fcde09297lhCUnIyj:Z


# direct methods
.method public constructor <init>(II)V
    .locals 5

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    
    new-instance v0, Ljava/util/ArrayList;
    nop
    nop

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f28d74d2b:Ljava/util/ArrayList;
    nop

    const/4 v0, 0x0
    nop
    nop

    
    iput v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f11680695:I
    nop
    nop
    nop

    
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->fcde09297:Z
    nop
    nop
    nop

    
    filled-new-array {p1, p2}, [I
    nop
    nop

    move-result-object v1
    nop
    nop
    nop

    const-class v2, Ljava/util/ArrayList;
    nop
    nop
    nop

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1
    nop
    nop
    nop

    check-cast v1, [[Ljava/util/ArrayList;
    nop

    iput-object v1, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f06e3d36f:[[Ljava/util/ArrayList;
    nop
    nop
    nop

    const/4 v1, 0x0
    nop
    nop

    :goto_0
    if-ge v1, p1, :cond_1
    nop
    nop
    nop

    const/4 v2, 0x0
    nop
    nop

    :goto_1
    if-ge v2, p2, :cond_0
    nop
    nop

    
    iget-object v3, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f06e3d36f:[[Ljava/util/ArrayList;
    nop

    aget-object v3, v3, v1
    nop
    nop

    new-instance v4, Ljava/util/ArrayList;
    nop
    nop
    nop

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    aput-object v4, v3, v2
    nop

    add-int/lit8 v2, v2, 0x1
    nop

    goto :goto_1
    nop
    nop
    nop

    :cond_0
    add-int/lit8 v1, v1, 0x1
    nop
    nop
    nop

    goto :goto_0
    nop
    nop
    nop

    :cond_1
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private cancelAnimation(Lcom/tpcstld/twozerogame/AnimationCell;ISLjava/lang/String;Z)V
