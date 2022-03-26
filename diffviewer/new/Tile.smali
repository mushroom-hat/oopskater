.class public Lcom/tpcstld/twozerogame/Tile;
.super Lcom/tpcstld/twozerogame/Cell;
.source "Tile.java"


# instance fields
.field private f880ca43a:[Lcom/tpcstld/twozerogame/Tile;

.field private f880ca43awCxGjCmY:[Lcom/tpcstld/twozerogame/Tile;

.field private f880ca43arTGXCLVJ:[Lcom/tpcstld/twozerogame/Tile;

.field private f880ca43aHmqGbfXn:[Lcom/tpcstld/twozerogame/Tile;

.field private fa12c9d45:[Lcom/tpcstld/twozerogame/Tile;

.field private fa12c9d45ztnXojhf:[Lcom/tpcstld/twozerogame/Tile;

.field private fa12c9d45NNxcUjbG:[Lcom/tpcstld/twozerogame/Tile;

.field private f0ac351ba:[Lcom/tpcstld/twozerogame/Tile;

.field private f0ac351balGsbuJGT:[Lcom/tpcstld/twozerogame/Tile;

.field private f0ac351bavdBdiDtW:[Lcom/tpcstld/twozerogame/Tile;

.field private f0ac351bahdYmaNnM:[Lcom/tpcstld/twozerogame/Tile;

.field private final f3101bd35:I

.field private final f3101bd35IjnvoNjN:I

.field private final f2297a5fb:I

.field private final f2297a5fbUTbgNKvD:I

.field private final f2297a5fbccoBAche:I

.field private final f2297a5fbtELebuHu:I

.field private final f2297a5fbOZcQICBc:I

.field private final f71c0944a:I

.field private final f71c0944abJhUyqyH:I

.field private final f71c0944aYgmPhTvw:I

.field private final fc3754d92:I

.field private final fc3754d92LqIssRuZ:I

.field private final f858cf05b:I

.field private final f858cf05bpvSRdewc:I

.field private final f858cf05bibjuBvSH:I

.field private final f858cf05bqFEFxUQe:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    const/4 p1, 0x0
    nop
    nop
    nop
    nop

    
    iput-object p1, p0, Lcom/tpcstld/twozerogame/Tile;->f880ca43a:[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop
    nop

    
    iput p3, p0, Lcom/tpcstld/twozerogame/Tile;->f3101bd35:I
    nop
    nop
    nop
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public constructor <init>(Lcom/tpcstld/twozerogame/Cell;I)V
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v0
    nop
    nop
    nop
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1
    nop
    nop
    nop
    nop

    invoke-direct {p0, v0, p1}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    const/4 p1, 0x0
    nop
    nop
    nop
    nop

    
    iput-object p1, p0, Lcom/tpcstld/twozerogame/Tile;->f880ca43a:[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop

    
    iput p2, p0, Lcom/tpcstld/twozerogame/Tile;->f3101bd35:I
    nop
    nop
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public getMergedFrom()[Lcom/tpcstld/twozerogame/Tile;
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/Tile;->f880ca43a:[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop

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

.method public getValue()I
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget v0, p0, Lcom/tpcstld/twozerogame/Tile;->f3101bd35:I
    nop
    nop
    nop

    return v0
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

.method public setMergedFrom([Lcom/tpcstld/twozerogame/Tile;)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iput-object p1, p0, Lcom/tpcstld/twozerogame/Tile;->f880ca43a:[Lcom/tpcstld/twozerogame/Tile;
    nop
    nop
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public updatePosition(Lcom/tpcstld/twozerogame/Cell;)V
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v0
    nop
    nop
    nop

    invoke-virtual {p0, v0}, Lcom/tpcstld/twozerogame/Tile;->setX(I)V

    
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1
    nop
    nop
    nop

    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/Tile;->setY(I)V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method
