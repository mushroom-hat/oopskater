.class public Lcom/tpcstld/twozerogame/AnimationGrid;
.super Ljava/lang/Object;
.source "AnimationGrid.java"


# instance fields
.field private f11680695:I

.field private f11680695AIoomLQZ:I

.field private f11680695VnGhHAJd:I

.field private f11680695RZkkrlVY:I

.field private f11680695OuoLebth:I

.field private final f06e3d36f:[[Ljava/util/ArrayList;

.field private final f06e3d36fXqEFAZvq:[[Ljava/util/ArrayList;

.field private final f06e3d36fMwZPSSwg:[[Ljava/util/ArrayList;
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

.field public final f28d74d2bgAoKZvaK:Ljava/util/ArrayList;

.field public final f28d74d2blXECgteC:Ljava/util/ArrayList;

.field public final f28d74d2bmNNCPDhg:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tpcstld/twozerogame/AnimationCell;",
            ">;"
        }
    .end annotation
.end field

.field private fcde09297:Z

.field private fcde09297JXtNcYRh:Z

.field private fcde09297fzUwfxYt:Z

.field private fcde09297cxyxDAVn:Z

.field private fcde09297zGuUBQPo:Z


# direct methods
.method public constructor <init>(II)V
    .locals 5

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    
    new-instance v0, Ljava/util/ArrayList;
    nop

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f28d74d2b:Ljava/util/ArrayList;
    nop
    nop
    nop

    const/4 v0, 0x0
    nop

    
    iput v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f11680695:I
    nop
    nop
    nop

    
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->fcde09297:Z
    nop

    
    filled-new-array {p1, p2}, [I
    nop

    move-result-object v1
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
    nop
    nop

    iput-object v1, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f06e3d36f:[[Ljava/util/ArrayList;
    nop
    nop

    const/4 v1, 0x0
    nop
    nop

    :goto_0
    if-ge v1, p1, :cond_1
    nop

    const/4 v2, 0x0
    nop

    :goto_1
    if-ge v2, p2, :cond_0
    nop
    nop

    
    iget-object v3, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f06e3d36f:[[Ljava/util/ArrayList;
    nop

    aget-object v3, v3, v1
    nop

    new-instance v4, Ljava/util/ArrayList;
    nop

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    aput-object v4, v3, v2
    nop

    add-int/lit8 v2, v2, 0x1
    nop
    nop
    nop

    goto :goto_1
    nop

    :cond_0
    add-int/lit8 v1, v1, 0x1
    nop
    nop
    nop

    goto :goto_0
    nop
    nop

    :cond_1
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private cancelAnimation(Lcom/tpcstld/twozerogame/AnimationCell;CZLjava/lang/String;I)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method private cancelAnimation(Lcom/tpcstld/twozerogame/AnimationCell;ZLjava/lang/String;IC)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method private cancelAnimation(Lcom/tpcstld/twozerogame/AnimationCell;Ljava/lang/String;IZC)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method private cancelAnimation(Lcom/tpcstld/twozerogame/AnimationCell;)V
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/AnimationCell;->getX()I

    move-result v0
    nop

    const/4 v1, -0x1
    nop
    nop

    if-ne v0, v1, :cond_0
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/AnimationCell;->getY()I

    move-result v0
    nop
    nop

    if-ne v0, v1, :cond_0
    nop

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f28d74d2b:Ljava/util/ArrayList;
    nop
    nop

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
    nop
    nop

    
    :cond_0
    iget-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f06e3d36f:[[Ljava/util/ArrayList;
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/AnimationCell;->getX()I

    move-result v1
    nop

    aget-object v0, v0, v1
    nop
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/AnimationCell;->getY()I

    move-result v1
    nop

    aget-object v0, v0, v1
    nop
    nop

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :goto_0
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public cancelAnimations()V
    .locals 8

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f06e3d36f:[[Ljava/util/ArrayList;
    nop
    nop

    array-length v1, v0
    nop
    nop

    const/4 v2, 0x0
    nop
    nop

    const/4 v3, 0x0
    nop

    :goto_0
    if-ge v3, v1, :cond_1
    nop
    nop

    aget-object v4, v0, v3
    nop
    nop

    
    array-length v5, v4
    nop

    const/4 v6, 0x0
    nop
    nop
    nop

    :goto_1
    if-ge v6, v5, :cond_0
    nop
    nop

    aget-object v7, v4, v6
    nop

    
    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    add-int/lit8 v6, v6, 0x1
    nop
    nop

    goto :goto_1
    nop
    nop

    :cond_0
    add-int/lit8 v3, v3, 0x1
    nop

    goto :goto_0
    nop
    nop
    nop

    
    :cond_1
    iget-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f28d74d2b:Ljava/util/ArrayList;
    nop

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    
    iput v2, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f11680695:I
    nop
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public getAnimationCell(II)Ljava/util/ArrayList;
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList<",
            "Lcom/tpcstld/twozerogame/AnimationCell;",
            ">;"
        }
    .end annotation

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f06e3d36f:[[Ljava/util/ArrayList;
    nop
    nop

    aget-object p1, v0, p1
    nop
    nop
    nop

    aget-object p1, p1, p2
    nop

    return-object p1
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public isAnimationActive()Z
    .locals 3

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f11680695:I
    nop
    nop
    nop

    const/4 v1, 0x1
    nop

    if-eqz v0, :cond_0
    nop
    nop

    
    iput-boolean v1, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->fcde09297:Z
    nop

    return v1
    nop
    nop

    
    :cond_0
    iget-boolean v0, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->fcde09297:Z
    nop

    const/4 v2, 0x0
    nop
    nop
    nop

    if-eqz v0, :cond_1
    nop

    
    iput-boolean v2, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->fcde09297:Z
    nop
    nop
    nop

    return v1
    nop
    nop
    nop

    :cond_1
    return v2
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public startAnimation(IIIJJ[I)V
    .locals 13

	goto/32 :after_last_instruction

	:before_first_instruction

    move-object v0, p0
    nop
    nop

    move v10, p1
    nop
    nop
    nop

    move v11, p2
    nop

    
    new-instance v12, Lcom/tpcstld/twozerogame/AnimationCell;
    nop
    nop

    move-object v1, v12
    nop
    nop
    nop

    move v2, p1
    nop
    nop
    nop

    move v3, p2
    nop

    move/from16 v4, p3
    nop
    nop

    move-wide/from16 v5, p4
    nop
    nop

    move-wide/from16 v7, p6
    nop
    nop
    nop

    move-object/from16 v9, p8
    nop
    nop
    nop

    invoke-direct/range {v1 .. v9}, Lcom/tpcstld/twozerogame/AnimationCell;-><init>(IIIJJ[I)V

    const/4 v1, -0x1
    nop

    if-ne v10, v1, :cond_0
    nop

    if-ne v11, v1, :cond_0
    nop

    
    iget-object v1, v0, Lcom/tpcstld/twozerogame/AnimationGrid;->f28d74d2b:Ljava/util/ArrayList;
    nop

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
    nop
    nop

    
    :cond_0
    iget-object v1, v0, Lcom/tpcstld/twozerogame/AnimationGrid;->f06e3d36f:[[Ljava/util/ArrayList;
    nop
    nop
    nop

    aget-object v1, v1, v10
    nop

    aget-object v1, v1, v11
    nop
    nop
    nop

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    
    :goto_0
    iget v1, v0, Lcom/tpcstld/twozerogame/AnimationGrid;->f11680695:I
    nop
    nop

    add-int/lit8 v1, v1, 0x1
    nop
    nop

    iput v1, v0, Lcom/tpcstld/twozerogame/AnimationGrid;->f11680695:I
    nop
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public tickAll(J)V
    .locals 11

	goto/32 :after_last_instruction

	:before_first_instruction

    
    new-instance v0, Ljava/util/ArrayList;
    nop

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    
    iget-object v1, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f28d74d2b:Ljava/util/ArrayList;
    nop
    nop
    nop

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1
    nop
    nop

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2
    nop
    nop
    nop

    if-eqz v2, :cond_1
    nop
    nop

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2
    nop

    check-cast v2, Lcom/tpcstld/twozerogame/AnimationCell;
    nop
    nop
    nop

    
    invoke-virtual {v2, p1, p2}, Lcom/tpcstld/twozerogame/AnimationCell;->tick(J)V

    
    invoke-virtual {v2}, Lcom/tpcstld/twozerogame/AnimationCell;->animationDone()Z

    move-result v3
    nop
    nop
    nop

    if-eqz v3, :cond_0
    nop
    nop

    
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    
    iget v2, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f11680695:I
    nop

    add-int/lit8 v2, v2, -0x1
    nop

    iput v2, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f11680695:I
    nop
    nop
    nop

    goto :goto_0
    nop

    
    :cond_1
    iget-object v1, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f06e3d36f:[[Ljava/util/ArrayList;
    nop

    array-length v2, v1
    nop
    nop

    const/4 v3, 0x0
    nop
    nop
    nop

    const/4 v4, 0x0
    nop

    :goto_1
    if-ge v4, v2, :cond_5
    nop
    nop
    nop

    aget-object v5, v1, v4
    nop

    
    array-length v6, v5
    nop
    nop

    const/4 v7, 0x0
    nop
    nop

    :goto_2
    if-ge v7, v6, :cond_4
    nop
    nop
    nop

    aget-object v8, v5, v7
    nop

    
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8
    nop
    nop

    :cond_2
    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9
    nop

    if-eqz v9, :cond_3
    nop
    nop
    nop

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9
    nop

    check-cast v9, Lcom/tpcstld/twozerogame/AnimationCell;
    nop
    nop

    
    invoke-virtual {v9, p1, p2}, Lcom/tpcstld/twozerogame/AnimationCell;->tick(J)V

    
    invoke-virtual {v9}, Lcom/tpcstld/twozerogame/AnimationCell;->animationDone()Z

    move-result v10
    nop

    if-eqz v10, :cond_2
    nop
    nop

    
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    
    iget v9, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f11680695:I
    nop
    nop
    nop

    add-int/lit8 v9, v9, -0x1
    nop
    nop
    nop

    iput v9, p0, Lcom/tpcstld/twozerogame/AnimationGrid;->f11680695:I
    nop
    nop
    nop

    goto :goto_3
    nop
    nop

    :cond_3
    add-int/lit8 v7, v7, 0x1
    nop
    nop
    nop

    goto :goto_2
    nop

    :cond_4
    add-int/lit8 v4, v4, 0x1
    nop

    goto :goto_1
    nop

    
    :cond_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1
    nop
    nop

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2
    nop
    nop

    if-eqz p2, :cond_6
    nop

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2
    nop
    nop

    check-cast p2, Lcom/tpcstld/twozerogame/AnimationCell;
    nop
    nop

    
    invoke-direct {p0, p2}, Lcom/tpcstld/twozerogame/AnimationGrid;->cancelAnimation(Lcom/tpcstld/twozerogame/AnimationCell;)V

    goto :goto_4
    nop
    nop
    nop

    :cond_6
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
