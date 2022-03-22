.class public Lcom/tpcstld/twozerogame/AnimationGrid;
.super Ljava/lang/Object;
.source "AnimationGrid.java"


# instance fields
.field private activeAnimations:I

.field private final field:[[Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[[",
            "Ljava/util/ArrayList<",
            "Lcom/tpcstld/twozerogame/AnimationCell;",
            ">;"
        }
    .end annotation
.end field

.field public final globalAnimation:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tpcstld/twozerogame/AnimationCell;",
            ">;"
        }
    .end annotation
.end field

.field private oneMoreFrame:Z


# direct methods
.method public constructor <init>(II)V
    .locals 5

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->globalAnimation:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->activeAnimations:I

    .line 10
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->oneMoreFrame:Z

    .line 13
    filled-new-array {p1, p2}, [I

    move-result-object v1

    const-class v2, Ljava/util/ArrayList;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->field:[[Ljava/util/ArrayList;

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_1

    const/4 v2, 0x0

    :goto_1
    if-ge v2, p2, :cond_0

    .line 17
    iget-object v3, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->field:[[Ljava/util/ArrayList;

    aget-object v3, v3, v1

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private cancelAnimation(Lcom/tpcstld/twozerogame/AnimationCell;)V
    .locals 2

    .line 86
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/AnimationCell;->getX()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/AnimationCell;->getY()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 87
    iget-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->globalAnimation:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->field:[[Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/AnimationCell;->getX()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/AnimationCell;->getY()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method


# virtual methods
.method public cancelAnimations()V
    .locals 8

    .line 76
    iget-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->field:[[Ljava/util/ArrayList;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 77
    array-length v5, v4

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v5, :cond_0

    aget-object v7, v4, v6

    .line 78
    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 81
    :cond_1
    iget-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->globalAnimation:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 82
    iput v2, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->activeAnimations:I

    return-void
.end method

.method public getAnimationCell(II)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList<",
            "Lcom/tpcstld/twozerogame/AnimationCell;",
            ">;"
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->field:[[Ljava/util/ArrayList;

    aget-object p1, v0, p1

    aget-object p1, p1, p2

    return-object p1
.end method

.method public isAnimationActive()Z
    .locals 3

    .line 60
    iget v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->activeAnimations:I

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 61
    iput-boolean v1, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->oneMoreFrame:Z

    return v1

    .line 63
    :cond_0
    iget-boolean v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->oneMoreFrame:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 64
    iput-boolean v2, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->oneMoreFrame:Z

    return v1

    :cond_1
    return v2
.end method

.method public startAnimation(IIIJJ[I)V
    .locals 13

    move-object v0, p0

    move v10, p1

    move v11, p2

    .line 23
    new-instance v12, Lcom/tpcstld/twozerogame/AnimationCell;

    move-object v1, v12

    move v2, p1

    move v3, p2

    move/from16 v4, p3

    move-wide/from16 v5, p4

    move-wide/from16 v7, p6

    move-object/from16 v9, p8

    invoke-direct/range {v1 .. v9}, Lcom/tpcstld/twozerogame/AnimationCell;-><init>(IIIJJ[I)V

    const/4 v1, -0x1

    if-ne v10, v1, :cond_0

    if-ne v11, v1, :cond_0

    .line 25
    iget-object v1, v0, Lcom/tpcstld/twozerogame/AnimationGrid;->globalAnimation:Ljava/util/ArrayList;

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 27
    :cond_0
    iget-object v1, v0, Lcom/tpcstld/twozerogame/AnimationGrid;->field:[[Ljava/util/ArrayList;

    aget-object v1, v1, v10

    aget-object v1, v1, v11

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    :goto_0
    iget v1, v0, Lcom/tpcstld/twozerogame/AnimationGrid;->activeAnimations:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/tpcstld/twozerogame/AnimationGrid;->activeAnimations:I

    return-void
.end method

.method public tickAll(J)V
    .locals 11

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    iget-object v1, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->globalAnimation:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/tpcstld/twozerogame/AnimationCell;

    .line 35
    invoke-virtual {v2, p1, p2}, Lcom/tpcstld/twozerogame/AnimationCell;->tick(J)V

    .line 36
    invoke-virtual {v2}, Lcom/tpcstld/twozerogame/AnimationCell;->animationDone()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 37
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    iget v2, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->activeAnimations:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->activeAnimations:I

    goto :goto_0

    .line 42
    :cond_1
    iget-object v1, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->field:[[Ljava/util/ArrayList;

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v2, :cond_5

    aget-object v5, v1, v4

    .line 43
    array-length v6, v5

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v6, :cond_4

    aget-object v8, v5, v7

    .line 44
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_2
    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/tpcstld/twozerogame/AnimationCell;

    .line 45
    invoke-virtual {v9, p1, p2}, Lcom/tpcstld/twozerogame/AnimationCell;->tick(J)V

    .line 46
    invoke-virtual {v9}, Lcom/tpcstld/twozerogame/AnimationCell;->animationDone()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 47
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    iget v9, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->activeAnimations:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->activeAnimations:I

    goto :goto_3

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 54
    :cond_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/tpcstld/twozerogame/AnimationCell;

    .line 55
    invoke-direct {p0, p2}, Lcom/tpcstld/twozerogame/AnimationGrid;->cancelAnimation(Lcom/tpcstld/twozerogame/AnimationCell;)V

    goto :goto_4

    :cond_6
    return-void
.end method
