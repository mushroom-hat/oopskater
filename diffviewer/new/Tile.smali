.class public Lcom/tpcstld/twozerogame/Tile;
.super Lcom/tpcstld/twozerogame/Cell;
.source "Tile.java"


# instance fields
.field private f0946e2a7:[Lcom/tpcstld/twozerogame/Tile;

.field private f0946e2a7muocdSIm:[Lcom/tpcstld/twozerogame/Tile;

.field private f0946e2a7rdFDVHkF:[Lcom/tpcstld/twozerogame/Tile;

.field private f0946e2a7AjOnTKAf:[Lcom/tpcstld/twozerogame/Tile;

.field private final f2063c160:I

.field private final f2063c160izTTKQJx:I

.field private final f2063c160mcVVfpaL:I

.field private final f2063c160sEWuuRFs:I

.field private final f2063c160sYVOAyXX:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    const/4 p1, 0x0
    nop
    nop
    nop

    
    iput-object p1, p0, Lcom/tpcstld/twozerogame/Tile;->f0946e2a7:[Lcom/tpcstld/twozerogame/Tile;
    nop

    
    iput p3, p0, Lcom/tpcstld/twozerogame/Tile;->f2063c160:I
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public constructor <init>(Lcom/tpcstld/twozerogame/Cell;I)V
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v0
    nop
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1
    nop
    nop

    invoke-direct {p0, v0, p1}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    const/4 p1, 0x0
    nop
    nop

    
    iput-object p1, p0, Lcom/tpcstld/twozerogame/Tile;->f0946e2a7:[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    
    iput p2, p0, Lcom/tpcstld/twozerogame/Tile;->f2063c160:I
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public getMergedFrom()[Lcom/tpcstld/twozerogame/Tile;
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/Tile;->f0946e2a7:[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    return-object v0
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public getValue()I
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget v0, p0, Lcom/tpcstld/twozerogame/Tile;->f2063c160:I
    nop
    nop
    nop

    return v0
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public setMergedFrom([Lcom/tpcstld/twozerogame/Tile;)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iput-object p1, p0, Lcom/tpcstld/twozerogame/Tile;->f0946e2a7:[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public updatePosition(Lcom/tpcstld/twozerogame/Cell;)V
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v0
    nop

    invoke-virtual {p0, v0}, Lcom/tpcstld/twozerogame/Tile;->setX(I)V

    
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1
    nop
    nop

    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/Tile;->setY(I)V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
