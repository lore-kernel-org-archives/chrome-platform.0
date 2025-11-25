Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E142DAFBB
	for <chrome-platform@lists.linux.dev>; Tue, 25 Nov 2025 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067283; cv=none; b=UjAPo5UD9P+qWsrSa0BisGXgCJ2FkPeV7fpwSeSg5OcKcT7PIixJtfDgaIohaEE8czsuf7IQ9cUGlIdXgmN6klpNxRxT2YtIXbennKhjqUTRFpm+mvw6qZkNy8E9CHUIYpwyD9Gt2IwkTTWEJMQHeqXFqxq4uJOmqYco+GX+gqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067283; c=relaxed/simple;
	bh=KbotNqeeDavJvfEQdPmkb/KEhmUXKqje0HVOv96a9aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLAosi6NXsu6rM+pFiT2kT2f/TgI+JiZ3IN7ZdEAPJrlzzecmlbk8GudjqqkuY859YIm5H53cJCRKhD6GiyteJxtgT7O1pwOuwLCOqlDvKKRN8b8Mmf6vXfQUfWBgQP2G2JqIx6yIJvaSHzhEShN9Dl8YO7Hn3bJqN8+zNHPMdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j7Yf9C9P; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j7Yf9C9P"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5959da48139so5633252e87.1
        for <chrome-platform@lists.linux.dev>; Tue, 25 Nov 2025 02:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764067279; x=1764672079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uRBPHCgSxkmaA78fH0tH+mnux44EIWHYlNpY/Tgdjw=;
        b=j7Yf9C9P077koIYyzt9rKRHFM9q8lCY5lbYDqRsNVfE1L8NCjSIvQvzaj4J485P/dc
         1RBlx8t/+k1EXWesfswIPVa+gES1xTGb8ta+87xkDxaMncnQN0GWCUWG5w6hkCckfUxm
         1yl7tS4QYFfQnyrobDBvIR5wsj9WDDIEo3LdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764067279; x=1764672079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4uRBPHCgSxkmaA78fH0tH+mnux44EIWHYlNpY/Tgdjw=;
        b=KiGLLtotjkTEDEEQFrxMV5vBlcRQfv3IsMG1lDXggwHx5lb/3yKKK17W3C1kP58inQ
         uTBVc9Jnv323pwFJCVzgKRcW46y1JvxqsnvyW6uldWs+NULAPzeRYojJBg2r6ByWhz2J
         fqIkV+DKJ/05seOfszVYrNtqCFb678vT3BjJKjWo/QYvOe/gDQ3jHGNQVv7LZ6+nVAOP
         BHih1OUZAGPHciRnvyST/GNGAwAQuInpurkx/z7gQyL1xxGy/g4h40pixEJ5++p1mOEr
         LNnsXaxLIYeFVSN6xMpiAH9nlgtL5Yzb8Aey5R9y/qbMQf58ueZYP/KBFIMnD9fKXhfY
         6KgA==
X-Forwarded-Encrypted: i=1; AJvYcCVrd3gaobsJ1hAztAEeYZrl5RUrjMoh7YtyoiN4CA1oDWLzQ1G162Z8jEvnrNZOX5B60udk/vddtjiV8+1s540=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXkqyx5GaO8N4ZK0ouKLEL6W7bEbS+HMSP7jzj/T8s+gEg/UqP
	T2jaclFmx2SNv5uflji0bhOxpjbGtRvkm4hURhFeOCsbbE4qFm7UhHudQFiVH00JB/FElbdP265
	uDZlyP23Gv0Kn56iDc+hoqVlHczqM8E38tqd0MtbO
X-Gm-Gg: ASbGncuL/0AShch4ogEfBvUrjN9ZmrQCWkubtNbsHpexQKX/u4ilePXhVKR6NYoRlfm
	SRjMJ2/dgDW6MLKfd9WaJaLjENeDoZiTtqZOfHZIMjPttsAEwOPFJBn8FjlJFpkSy1usJrbusra
	mB369E3GHlBC68oA3LHRApSZj9O98gxqgoEMAZ+f62PQHCAF5/HQowBVcFM8YGbTH9/PsBO1P0C
	QagQI4yxVETywtoPvt8K8fC//g79E+GxcI7j8gA7HFts00ocJ445hBQQXg4jdyF/v+SUfj8MIOG
	kPfPZKkilzrKB2NLY0isLxg55A==
X-Google-Smtp-Source: AGHT+IEvG4Z5BDTpsXarI8urYSbz0Fl43OcTx4ljWTzmBa3AfdjhQoWcQWwcIqnRa4+KmNQLabuz9wzK0SNkgegXMCw=
X-Received: by 2002:a05:6512:3ba0:b0:595:9152:b921 with SMTP id
 2adb3069b0e04-596b4e5295amr1036056e87.7.1764067279453; Tue, 25 Nov 2025
 02:41:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251125064851.3781993-1-wenst@chromium.org> <20251125-outgoing-boisterous-millipede-6dabaf@kuoka>
In-Reply-To: <20251125-outgoing-boisterous-millipede-6dabaf@kuoka>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Nov 2025 18:41:07 +0800
X-Gm-Features: AWmQ_bmfVl5k0ztWOG2j8X7oHX9X2PsUhMj61BqVp-yFp5zCJvMWxcyYcL4rKWg
Message-ID: <CAGXv+5FPaJMuN7wCP7g0Rxa0mXD3Ru0rxka=m8B_rv+XUkJPWA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 6:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 25, 2025 at 02:48:49PM +0800, Chen-Yu Tsai wrote:
> > Convert the existing text binding to YAML.
> >
> > The description has been change to reflect the possibility of coreboot
> > inserting the node itself.
> >
> > The example has been modified to compile and pass validation without
> > any errors. A comment was added to note what the firmware actually
> > emits.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../devicetree/bindings/firmware/coreboot.txt | 33 ----------
> >  .../bindings/firmware/coreboot.yaml           | 60 +++++++++++++++++++
> >  2 files changed, 60 insertions(+), 33 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/firmware/coreboot=
.txt
> >  create mode 100644 Documentation/devicetree/bindings/firmware/coreboot=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/=
Documentation/devicetree/bindings/firmware/coreboot.txt
> > deleted file mode 100644
> > index 4c955703cea8..000000000000
> > --- a/Documentation/devicetree/bindings/firmware/coreboot.txt
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -COREBOOT firmware information
> > -
> > -The device tree node to communicate the location of coreboot's memory-=
resident
> > -bookkeeping structures to the kernel. Since coreboot itself cannot boo=
t a
> > -device-tree-based kernel (yet), this node needs to be inserted by a
> > -second-stage bootloader (a coreboot "payload").
> > -
> > -Required properties:
> > - - compatible: Should be "coreboot"
> > - - reg: Address and length of the following two memory regions, in ord=
er:
> > -     1.) The coreboot table. This is a list of variable-sized descript=
ors
> > -     that contain various compile- and run-time generated firmware
> > -     parameters. It is identified by the magic string "LBIO" in its fi=
rst
> > -     four bytes.
> > -     See coreboot's src/commonlib/include/commonlib/coreboot_tables.h =
for
> > -     details.
> > -     2.) The CBMEM area. This is a downward-growing memory region used=
 by
> > -     coreboot to dynamically allocate data structures that remain resi=
dent.
> > -     It may or may not include the coreboot table as one of its member=
s. It
> > -     is identified by a root node descriptor with the magic number
> > -     0xc0389481 that resides in the topmost 8 bytes of the area.
> > -     See coreboot's src/include/imd.h for details.
> > -
> > -Example:
> > -     firmware {
> > -             ranges;
> > -
> > -             coreboot {
> > -                     compatible =3D "coreboot";
> > -                     reg =3D <0xfdfea000 0x264>,
> > -                           <0xfdfea000 0x16000>;
> > -             }
> > -     };
> > diff --git a/Documentation/devicetree/bindings/firmware/coreboot.yaml b=
/Documentation/devicetree/bindings/firmware/coreboot.yaml
> > new file mode 100644
> > index 000000000000..568afd1abb92
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/coreboot.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/firmware/coreboot.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: COREBOOT firmware information
>
> Coreboot

OK. Side note, coreboot is stylized in all lowercase letters.
Should I follow that or just use standard English rules?

> > +
> > +maintainers:
> > +  - Julius Werner <jwerner@chromium.org>
> > +
> > +description:
> > +  The device tree node to communicate the location of coreboot's
> > +  memory-resident bookkeeping structures to the kernel. Coreboot's
> > +  FIT image payload can insert the node into the device tree. If a
> > +  second-stage bootloader (a coreboot "payload") is used, then it
> > +  is responsible for inserting the node.
> > +
> > +properties:
> > +  compatible:
> > +    const: coreboot
>
> Blank line (it is always here, there is no example without, which makes
> me wonder which file you took as starting point)

I actually converted the existing text file directly, copying
boilerplate, i.e. the top few lines, from another file.

> > +  reg:
> > +    description: Address and length of the following two memory region=
s
>
> Drop description, redundant.

Ack.

> > +    items:
> > +      - description:
> > +          The coreboot table. This is a list of variable-sized descrip=
tors
> > +          that contain various compile- and run-time generated firmwar=
e
> > +          parameters. It is identified by the magic string "LBIO" in i=
ts first
> > +          four bytes.
> > +
> > +          See coreboot's src/commonlib/include/commonlib/coreboot_tabl=
es.h for
> > +          details.
> > +      - description:
> > +          The CBMEM area. This is a downward-growing memory region use=
d by
> > +          coreboot to dynamically allocate data structures that remain=
 resident.
> > +          It may or may not include the coreboot table as one of its m=
embers. It
> > +          is identified by a root node descriptor with the magic numbe=
r
> > +          0xc0389481 that resides in the topmost 8 bytes of the area.
> > +
> > +          See coreboot's src/include/imd.h for details.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    firmware {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +        ranges;
> > +
> > +        /* Firmware actually emits "coreboot" node without unit name *=
/
> > +        coreboot@fdfea000 {
> > +            compatible =3D "coreboot";
> > +            reg =3D <0xfdfea000 0x264>, <0xfdfea000 0x16000>;
>
> That's the same address in both places, so the same one entry. You need
> two distinctive addresses or binding needs changes to have only one item
> as well.

The description does mention that the latter block can include the
former. It's really up to the firmware. If you like I can include
two examples to cover both cases.


ChenYu
