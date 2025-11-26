Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237D24C6C
	for <chrome-platform@lists.linux.dev>; Wed, 26 Nov 2025 00:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764117383; cv=none; b=GiD4ItrTP/laHrUM8VJXMe6HdSdnQVpaNmEcoC4QYu+w4+yDdzUJFs3vG5nV4yEPRNHMx/B7PPc8vBBgwDGO7uIEisJuY/MLypV71gEAVd6DwYPNYwqAy3149dKa7hhfVnsufz+k4akQylzDnlf2wMt0TB3iSJgxsfVNM4CF3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764117383; c=relaxed/simple;
	bh=7LudohsYC1oaD5/J7Dbq5dstKtMkG/Ng87rePwFfE88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCCH7RSdtlK1x7YiEIDkG4wg8PtOLaYrXUrXKRVl9yhPulJTrzHHG8phQ37BKZpuqp7Wl8bbXvK7ccMLz94ssna/I037PnlfRED5SxItpOdvL31K3PQXQiOIOQwW7BhmWL1NZO/BQAEPU0XqExHZcUdaWnGmg/teMwuJcY4g/QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KVmROafw; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KVmROafw"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ee147baf7bso71301cf.1
        for <chrome-platform@lists.linux.dev>; Tue, 25 Nov 2025 16:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764117381; x=1764722181; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n5PIGTFLdkW4IniYiOexcRvEmMURl8sUXIKPSPYdx5o=;
        b=KVmROafwkkDb3hSonwrKOdyAe3KT5EI4D2m2Qre8g9HmbM9lzcY3KeSzQZ+O+bZ171
         ts429mgGmcOrQdW7T0yIfziOmSq7j2xdDpaPvPX03qj0E0CnfePfZxud4xQel3aWcWR3
         js+JHTMdO9pNXfjjnyL5Fb0kNfiKa1d6Ix3tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764117381; x=1764722181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5PIGTFLdkW4IniYiOexcRvEmMURl8sUXIKPSPYdx5o=;
        b=L42aJ6gvOfZ3phBrTBQckN0UZssERAmdOTsNE8xL0udEtWfKy1rnijEnIShE4gDYax
         ArRz+SR0uTcSJ43BLeYqgoP3AKvRrBVBRqIQeW10hALSdZVwC4mk7n/MyCz27YBcdJPv
         uCiEd2exgU9bFKWXTKS+mejleM3tcBtuqkiUEMZm+/0gWCDD7/40x+CAIJLIFqYf6DpJ
         WCSqxBWk0LYdtMXqxovA+Rw+TlOuQVOF72Uh8xaVMmNcmz2d540h7CziJKXLRNrcrs/n
         qtUnhrS6GMbmjiiMuHgXviQ5rC2ALGoKSr/B18rMTx4PzsdZJYknPaU+wP2QUxrlRH17
         GgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSAP9xNXhntFF+OSt1KdkNlTMUmHLwD6LtwmHaO99LQt75DR1cjXb4lyIEVywn2ZNgFLYUqRf77sHu3krFrK8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvoWhTYQXZ3I5HT4wf8FUaLSd1crZVpcwvzElKNxykPG75wGDg
	5YxgmtKzGI/vw4Tf+mdeTzeCq4p1LINLcRnzP2uijfAAajPXnfYwNvbYQiW7WJSZzsf7WW0PDAg
	wDGW9TTGAY4RcqwDLIN6KPXpTP31A8VSNAOL58FC1
X-Gm-Gg: ASbGncvOhNbACkBwhJZ39Zg1oakzReRWJkEDRgf8//VGXZWY4MpCYcWh09eESCXOX9W
	bdD9Unz2LvWgJiVqETb8cCT8CEWzMWauSkTx9SSX3My2mZhWwV9e9yp3GAB9F83o6a4P9gFzd/N
	EYYKkQtN7DloErUKp6uNFgRtqHzDAd7MX1LTKKbkD/ClbIAbcD/nk7IZ6CuRtELt2Pdi7rXvFby
	SvSc0XCN5ugl1sEMo+Co/pvF7XB7XeEx4QZeVNRWbLMSFV982cI70dfdidyt8x6Gb/+KNU=
X-Google-Smtp-Source: AGHT+IGP6oX1F/D2CxJOatUpgvnDhypTahl/TVp41rMeFMAZHUR682n0RVM907rgexwTnBhQMCJvipynTviLMfsb/Ok=
X-Received: by 2002:ac8:580e:0:b0:4b7:a72f:55d9 with SMTP id
 d75a77b69052e-4efc83b0345mr1017551cf.13.1764117380805; Tue, 25 Nov 2025
 16:36:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251125064851.3781993-1-wenst@chromium.org> <20251125-outgoing-boisterous-millipede-6dabaf@kuoka>
 <CAGXv+5FPaJMuN7wCP7g0Rxa0mXD3Ru0rxka=m8B_rv+XUkJPWA@mail.gmail.com> <25ee55eb-91d6-4da2-a798-b704acfae4fe@kernel.org>
In-Reply-To: <25ee55eb-91d6-4da2-a798-b704acfae4fe@kernel.org>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 25 Nov 2025 16:36:07 -0800
X-Gm-Features: AWmQ_bkYsZKnR0Rl94iSzfQ_dAjBcO2VNFs_DTYgpRBgQH_dr4_09XaXBAvsBPc
Message-ID: <CAODwPW_LfeC7UFnDMxJFfKCFBoGBvu2O6S=otD0Sj7ssOSJVgw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >>> +title: COREBOOT firmware information
> >>
> >> Coreboot
> >
> > OK. Side note, coreboot is stylized in all lowercase letters.
> > Should I follow that or just use standard English rules?
>
> Just choose one. Here was capitals, but in description not. Preferably
> Coreboot or coreboot

coreboot should always be written all lowercase, even at the start of
a sentence (i.e. "...bookkeeping structures to the kernel. coreboot's
FIT image payload can insert..."). Not sure why I wrote it in caps in
the heading here, that was never really correct, not even back then.

> >>> +  The device tree node to communicate the location of coreboot's
> >>> +  memory-resident bookkeeping structures to the kernel. Coreboot's
> >>> +  FIT image payload can insert the node into the device tree. If a

nit: Not really sure what "coreboot's FIT image payload" is supposed
to be? Do you mean "coreboot's FIT image code"? (The file is just
called fit_payload.c because the FIT image takes the place of the
usual coreboot payload, but the code that does the device tree
stitching itself is still coreboot proper.) To make the point you're
trying to make here, why not just say: "This node may be inserted
either by coreboot itself or by a second-stage bootloader (a coreboot
"payload"), depending on where the kernel device tree is finalized."

> >>> +        /* Firmware actually emits "coreboot" node without unit name */
> >>> +        coreboot@fdfea000 {
> >>> +            compatible = "coreboot";
> >>> +            reg = <0xfdfea000 0x264>, <0xfdfea000 0x16000>;
> >>
> >> That's the same address in both places, so the same one entry. You need
> >> two distinctive addresses or binding needs changes to have only one item
> >> as well.
> >
> > The description does mention that the latter block can include the
> > former. It's really up to the firmware. If you like I can include
> > two examples to cover both cases.
>
> Lovely, I don't think we should accept growing this binding at all until
> coreboot fixes this mess (duplicated entry and missing unit address).

As Chen-Yu said, the second region usually contains the first. It is
possible (in fact tends to be common on many platforms, because the
coreboot table is often the last region added to the downward-growing
CBMEM) for the start addresses to match. That is not an error or a
"duplicate", they're still describing two different things.

We can start adding the @<address> part if you want but it hasn't
really been relevant in practice since there will always be only one
coreboot in the system anyway. As far as I understand, node names are
just informational in the device tree and the compatible string is
what identifies the actual binding. Since bootloaders on older
platforms often don't get updated, it is probably still a good idea to
 mention that in a comment like Chen-Yu did here even if we change it.
