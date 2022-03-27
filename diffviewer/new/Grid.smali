.class public Lcom/tpcstld/twozerogame/Grid;
.super Ljava/lang/Object;
.source "Grid.java"


# instance fields
.field private final ff4547fa3:[[Lcom/tpcstld/twozerogame/Tile;

.field private final ff4547fa3SGRnulnQ:[[Lcom/tpcstld/twozerogame/Tile;

.field private final ff4547fa3qiLNJflh:[[Lcom/tpcstld/twozerogame/Tile;

.field public final f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;

.field public final f06e3d36fLjDYoDeC:[[Lcom/tpcstld/twozerogame/Tile;

.field public final f06e3d36fDrbuioDl:[[Lcom/tpcstld/twozerogame/Tile;

.field public final f06e3d36fDBLgHMpk:[[Lcom/tpcstld/twozerogame/Tile;

.field public final f06e3d36fWRwJHjCx:[[Lcom/tpcstld/twozerogame/Tile;

.field public final f56bdbb6e:[[Lcom/tpcstld/twozerogame/Tile;

.field public final f56bdbb6eRLyCYCHn:[[Lcom/tpcstld/twozerogame/Tile;

.field public final f56bdbb6eJPWwYwRE:[[Lcom/tpcstld/twozerogame/Tile;

.field public final f56bdbb6eWxbSDsZg:[[Lcom/tpcstld/twozerogame/Tile;


# direct methods
.method public constructor <init>(II)V
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    
    filled-new-array {p1, p2}, [I
    nop
    nop
    nop

    move-result-object v0
    nop
    nop
    nop

    const-class v1, Lcom/tpcstld/twozerogame/Tile;
    nop

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0
    nop
    nop

    check-cast v0, [[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    iput-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    
    filled-new-array {p1, p2}, [I
    nop

    move-result-object v0
    nop
    nop
    nop

    const-class v1, Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0
    nop

    check-cast v0, [[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    iput-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->f56bdbb6e:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    
    filled-new-array {p1, p2}, [I
    nop
    nop

    move-result-object p1
    nop
    nop
    nop

    const-class p2, Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    invoke-static {p2, p1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object p1
    nop

    check-cast p1, [[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    iput-object p1, p0, Lcom/tpcstld/twozerogame/Grid;->ff4547fa3:[[Lcom/tpcstld/twozerogame/Tile;
    nop

    
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/Grid;->clearGrid()V

    
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/Grid;->clearUndoGrid()V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private clearUndoGrid()V
    .locals 5

	goto/32 :after_last_instruction

	:before_first_instruction

    const/4 v0, 0x0
    nop

    const/4 v1, 0x0
    nop

    
    :goto_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    array-length v2, v2
    nop

    if-ge v1, v2, :cond_1
    nop
    nop
    nop

    const/4 v2, 0x0
    nop
    nop
    nop

    
    :goto_1
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop

    aget-object v3, v3, v0
    nop
    nop

    array-length v3, v3
    nop
    nop
    nop

    if-ge v2, v3, :cond_0
    nop
    nop
    nop

    
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->f56bdbb6e:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    aget-object v3, v3, v1
    nop
    nop
    nop

    const/4 v4, 0x0
    nop
    nop
    nop

    aput-object v4, v3, v2
    nop
    nop
    nop

    add-int/lit8 v2, v2, 0x1
    nop
    nop

    goto :goto_1
    nop
    nop
    nop

    :cond_0
    add-int/lit8 v1, v1, 0x1
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

.method private getAvailableCells()Ljava/util/ArrayList;
    .locals 6

	goto/32 :after_last_instruction

	:before_first_instruction
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/tpcstld/twozerogame/Cell;",
            ">;"
        }
    .end annotation

    
    new-instance v0, Ljava/util/ArrayList;
    nop
    nop
    nop

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0
    nop

    const/4 v2, 0x0
    nop
    nop
    nop

    
    :goto_0
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    array-length v3, v3
    nop

    if-ge v2, v3, :cond_2
    nop
    nop
    nop

    const/4 v3, 0x0
    nop
    nop

    
    :goto_1
    iget-object v4, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    aget-object v5, v4, v1
    nop
    nop

    array-length v5, v5
    nop
    nop

    if-ge v3, v5, :cond_1
    nop
    nop
    nop

    
    aget-object v4, v4, v2
    nop

    aget-object v4, v4, v3
    nop
    nop

    if-nez v4, :cond_0
    nop
    nop
    nop

    
    new-instance v4, Lcom/tpcstld/twozerogame/Cell;
    nop
    nop

    invoke-direct {v4, v2, v3}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1
    nop

    goto :goto_1
    nop
    nop

    :cond_1
    add-int/lit8 v2, v2, 0x1
    nop

    goto :goto_0
    nop
    nop
    nop

    :cond_2
    return-object v0
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private isCellWithinBounds(II)Z
    .locals 3

	goto/32 :after_last_instruction

	:before_first_instruction

    const/4 v0, 0x0
    nop
    nop
    nop

    if-ltz p1, :cond_0
    nop
    nop

    
    iget-object v1, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    array-length v2, v1
    nop
    nop

    if-ge p1, v2, :cond_0
    nop
    nop
    nop

    if-ltz p2, :cond_0
    nop
    nop

    aget-object p1, v1, v0
    nop
    nop
    nop

    array-length p1, p1
    nop

    if-ge p2, p1, :cond_0
    nop

    const/4 v0, 0x1
    nop

    :cond_0
    return v0
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public clearGrid()V
    .locals 5

	goto/32 :after_last_instruction

	:before_first_instruction

    const/4 v0, 0x0
    nop

    const/4 v1, 0x0
    nop

    
    :goto_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop

    array-length v2, v2
    nop

    if-ge v1, v2, :cond_1
    nop
    nop

    const/4 v2, 0x0
    nop

    
    :goto_1
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    aget-object v4, v3, v0
    nop

    array-length v4, v4
    nop

    if-ge v2, v4, :cond_0
    nop

    
    aget-object v3, v3, v1
    nop
    nop
    nop

    const/4 v4, 0x0
    nop
    nop

    aput-object v4, v3, v2
    nop
    nop
    nop

    add-int/lit8 v2, v2, 0x1
    nop
    nop

    goto :goto_1
    nop
    nop

    :cond_0
    add-int/lit8 v1, v1, 0x1
    nop
    nop
    nop

    goto :goto_0
    nop

    :cond_1
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public getCellContent(II)Lcom/tpcstld/twozerogame/Tile;
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/Grid;->isCellWithinBounds(II)Z

    move-result v0
    nop

    if-eqz v0, :cond_0
    nop
    nop
    nop

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    aget-object p1, v0, p1
    nop
    nop

    aget-object p1, p1, p2
    nop
    nop
    nop

    return-object p1
    nop
    nop
    nop

    :cond_0
    const/4 p1, 0x0
    nop

    return-object p1
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public getCellContent(Lcom/tpcstld/twozerogame/Cell;)Lcom/tpcstld/twozerogame/Tile;
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

    if-eqz p1, :cond_0
    nop

    
    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/Grid;->isCellWithinBounds(Lcom/tpcstld/twozerogame/Cell;)Z

    move-result v0
    nop
    nop

    if-eqz v0, :cond_0
    nop

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v1
    nop
    nop
    nop

    aget-object v0, v0, v1
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1
    nop
    nop
    nop

    aget-object p1, v0, p1
    nop

    return-object p1
    nop
    nop

    :cond_0
    const/4 p1, 0x0
    nop

    return-object p1
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public insertTile(Lcom/tpcstld/twozerogame/Tile;)V
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getX()I

    move-result v1
    nop
    nop

    aget-object v0, v0, v1
    nop
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getY()I

    move-result v1
    nop

    aput-object p1, v0, v1
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public isCellAvailable(Lcom/tpcstld/twozerogame/Cell;)Z
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/Grid;->isCellOccupied(Lcom/tpcstld/twozerogame/Cell;)Z

    move-result p1
    nop
    nop
    nop

    xor-int/lit8 p1, p1, 0x1
    nop
    nop
    nop

    return p1
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public isCellOccupied(Lcom/tpcstld/twozerogame/Cell;)Z
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/Grid;->getCellContent(Lcom/tpcstld/twozerogame/Cell;)Lcom/tpcstld/twozerogame/Tile;

    move-result-object p1
    nop
    nop
    nop

    if-eqz p1, :cond_0
    nop

    const/4 p1, 0x1
    nop
    nop

    goto :goto_0
    nop
    nop
    nop

    :cond_0
    const/4 p1, 0x0
    nop
    nop

    :goto_0
    return p1
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public isCellWithinBounds(Lcom/tpcstld/twozerogame/Cell;)Z
    .locals 3

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v0
    nop
    nop

    const/4 v1, 0x0
    nop

    if-ltz v0, :cond_0
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v0
    nop

    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop

    array-length v2, v2
    nop

    if-ge v0, v2, :cond_0
    nop
    nop
    nop

    
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result v0
    nop
    nop

    if-ltz v0, :cond_0
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1
    nop

    iget-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop

    aget-object v0, v0, v1
    nop
    nop

    array-length v0, v0
    nop

    if-ge p1, v0, :cond_0
    nop
    nop
    nop

    const/4 v1, 0x1
    nop
    nop
    nop

    :cond_0
    return v1
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public isCellsAvailable()Z
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/Grid;->getAvailableCells()Ljava/util/ArrayList;

    move-result-object v0
    nop
    nop

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0
    nop

    const/4 v1, 0x1
    nop
    nop

    if-lt v0, v1, :cond_0
    nop
    nop

    goto :goto_0
    nop
    nop
    nop

    :cond_0
    const/4 v1, 0x0
    nop
    nop

    :goto_0
    return v1
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public prepareSaveTiles()V
    .locals 6

	goto/32 :after_last_instruction

	:before_first_instruction

    const/4 v0, 0x0
    nop

    const/4 v1, 0x0
    nop
    nop
    nop

    
    :goto_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    array-length v2, v2
    nop
    nop
    nop

    if-ge v1, v2, :cond_2
    nop

    const/4 v2, 0x0
    nop
    nop
    nop

    
    :goto_1
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    aget-object v4, v3, v0
    nop

    array-length v4, v4
    nop

    if-ge v2, v4, :cond_1
    nop
    nop
    nop

    
    aget-object v4, v3, v1
    nop
    nop

    aget-object v4, v4, v2
    nop
    nop

    if-nez v4, :cond_0
    nop
    nop
    nop

    
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->ff4547fa3:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    aget-object v3, v3, v1
    nop

    const/4 v4, 0x0
    nop
    nop
    nop

    aput-object v4, v3, v2
    nop
    nop

    goto :goto_2
    nop
    nop
    nop

    
    :cond_0
    iget-object v4, p0, Lcom/tpcstld/twozerogame/Grid;->ff4547fa3:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    aget-object v4, v4, v1
    nop
    nop
    nop

    new-instance v5, Lcom/tpcstld/twozerogame/Tile;
    nop

    aget-object v3, v3, v1
    nop

    aget-object v3, v3, v2
    nop
    nop
    nop

    invoke-virtual {v3}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v3
    nop

    invoke-direct {v5, v1, v2, v3}, Lcom/tpcstld/twozerogame/Tile;-><init>(III)V

    aput-object v5, v4, v2
    nop
    nop
    nop

    :goto_2
    add-int/lit8 v2, v2, 0x1
    nop

    goto :goto_1
    nop

    :cond_1
    add-int/lit8 v1, v1, 0x1
    nop
    nop
    nop

    goto :goto_0
    nop
    nop
    nop

    :cond_2
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public randomAvailableCell()Lcom/tpcstld/twozerogame/Cell;
    .locals 5

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/Grid;->getAvailableCells()Ljava/util/ArrayList;

    move-result-object v0
    nop
    nop
    nop

    
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1
    nop
    nop

    const/4 v2, 0x1
    nop
    nop

    if-lt v1, v2, :cond_0
    nop

    
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v1
    nop
    nop
    nop

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3
    nop

    int-to-double v3, v3
    nop

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, v3
    nop

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1
    nop
    nop

    double-to-int v1, v1
    nop
    nop
    nop

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0
    nop
    nop
    nop

    check-cast v0, Lcom/tpcstld/twozerogame/Cell;
    nop
    nop
    nop

    return-object v0
    nop
    nop
    nop

    :cond_0
    const/4 v0, 0x0
    nop

    return-object v0
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public removeTile(Lcom/tpcstld/twozerogame/Tile;)V
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getX()I

    move-result v1
    nop
    nop
    nop

    aget-object v0, v0, v1
    nop
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getY()I

    move-result p1
    nop
    nop

    const/4 v1, 0x0
    nop
    nop
    nop

    aput-object v1, v0, p1
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public revertTiles()V
    .locals 6

	goto/32 :after_last_instruction

	:before_first_instruction

    const/4 v0, 0x0
    nop
    nop
    nop

    const/4 v1, 0x0
    nop
    nop
    nop

    
    :goto_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->f56bdbb6e:[[Lcom/tpcstld/twozerogame/Tile;
    nop

    array-length v2, v2
    nop
    nop

    if-ge v1, v2, :cond_2
    nop
    nop
    nop

    const/4 v2, 0x0
    nop

    
    :goto_1
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->f56bdbb6e:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    aget-object v4, v3, v0
    nop

    array-length v4, v4
    nop
    nop
    nop

    if-ge v2, v4, :cond_1
    nop
    nop
    nop

    
    aget-object v4, v3, v1
    nop

    aget-object v4, v4, v2
    nop

    if-nez v4, :cond_0
    nop
    nop
    nop

    
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop

    aget-object v3, v3, v1
    nop
    nop

    const/4 v4, 0x0
    nop
    nop
    nop

    aput-object v4, v3, v2
    nop
    nop
    nop

    goto :goto_2
    nop
    nop
    nop

    
    :cond_0
    iget-object v4, p0, Lcom/tpcstld/twozerogame/Grid;->f06e3d36f:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    aget-object v4, v4, v1
    nop
    nop
    nop

    new-instance v5, Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    aget-object v3, v3, v1
    nop
    nop

    aget-object v3, v3, v2
    nop
    nop

    invoke-virtual {v3}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v3
    nop
    nop

    invoke-direct {v5, v1, v2, v3}, Lcom/tpcstld/twozerogame/Tile;-><init>(III)V

    aput-object v5, v4, v2
    nop
    nop

    :goto_2
    add-int/lit8 v2, v2, 0x1
    nop

    goto :goto_1
    nop
    nop
    nop

    :cond_1
    add-int/lit8 v1, v1, 0x1
    nop
    nop

    goto :goto_0
    nop
    nop

    :cond_2
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public saveTiles()V
    .locals 6

	goto/32 :after_last_instruction

	:before_first_instruction

    const/4 v0, 0x0
    nop
    nop

    const/4 v1, 0x0
    nop
    nop
    nop

    
    :goto_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->ff4547fa3:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    array-length v2, v2
    nop

    if-ge v1, v2, :cond_2
    nop
    nop

    const/4 v2, 0x0
    nop
    nop

    
    :goto_1
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->ff4547fa3:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

    aget-object v4, v3, v0
    nop
    nop
    nop

    array-length v4, v4
    nop
    nop
    nop

    if-ge v2, v4, :cond_1
    nop
    nop

    
    aget-object v4, v3, v1
    nop
    nop
    nop

    aget-object v4, v4, v2
    nop

    if-nez v4, :cond_0
    nop
    nop

    
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->f56bdbb6e:[[Lcom/tpcstld/twozerogame/Tile;
    nop

    aget-object v3, v3, v1
    nop
    nop
    nop

    const/4 v4, 0x0
    nop
    nop

    aput-object v4, v3, v2
    nop

    goto :goto_2
    nop

    
    :cond_0
    iget-object v4, p0, Lcom/tpcstld/twozerogame/Grid;->f56bdbb6e:[[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    aget-object v4, v4, v1
    nop

    new-instance v5, Lcom/tpcstld/twozerogame/Tile;
    nop

    aget-object v3, v3, v1
    nop
    nop

    aget-object v3, v3, v2
    nop
    nop
    nop

    invoke-virtual {v3}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v3
    nop

    invoke-direct {v5, v1, v2, v3}, Lcom/tpcstld/twozerogame/Tile;-><init>(III)V

    aput-object v5, v4, v2
    nop

    :goto_2
    add-int/lit8 v2, v2, 0x1
    nop
    nop
    nop

    goto :goto_1
    nop
    nop
    nop

    :cond_1
    add-int/lit8 v1, v1, 0x1
    nop
    nop
    nop

    goto :goto_0
    nop
    nop
    nop

    :cond_2
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
