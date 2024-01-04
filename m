Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA9020F7
	for <chrome-platform@lists.linux.dev>; Thu,  4 Jan 2024 00:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yg/MFmib"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7c6f0487so7685620e87.3
        for <chrome-platform@lists.linux.dev>; Wed, 03 Jan 2024 16:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704328712; x=1704933512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeSEM9FnhCQHetUK/2V8lmbOcksPqkXqmCZ/w8B3yNs=;
        b=Yg/MFmibBtt99PD2HLPyYmdiQ5EuwdsDdydGzkooXCd/slWobYv5+vEUiRicEWUe2V
         hzqFjalAzcieVTYWFRnV0rfHkaclubI9nVvvYowRnhoxsvvW99a0+eHtq4kxYpGsLARM
         c0MkfnXIwm4fLXC+3EEx/iYj4DSHG2LwcOdNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704328712; x=1704933512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WeSEM9FnhCQHetUK/2V8lmbOcksPqkXqmCZ/w8B3yNs=;
        b=VHzzteJfMYOCTn+dZ2AUkUKdoheT2cERYukM5HHMiugKtiosWKYNVzSsCWfLxndzsV
         WsrM+8BSGG77Sgdhzbzf6xo2guexEDBIDJUI0VUARnfpbYrGg13KLCZWyevNZjnkbjlI
         0602CTxcy2rXB0AcLGMSjxzNFfjzkkBu8AS6vRyAEznnFph4m9RhaXJTEZ4AEe/pVgsx
         mfivxXKeaOY+eFr7rcSDGliJowgMdt4PN8LKs8c7Y6pEDun+v0W7iz4Mok90p9Ugoybb
         bXHecbzirPkUnB38hUXhgKm475YX73sAxtYShSO1u+bK++sOpG8kTNqtBwhDXhe7tAYI
         H7Sg==
X-Gm-Message-State: AOJu0Yyrtumu2WhkNgSFilwoSam1UK4ilrdLsPQH6E/EcyKeZLuaqvod
	LJtgQRNFMicywwMRu694UNuN734ZdKdwVGOguNSr/qBekZzg
X-Google-Smtp-Source: AGHT+IH5TiJLJAwWw1IiZgdfve2aCAaTuhmjUVYOptdj5QYk7WMPA8Q7ozG9oW8WM4Og9/cgsdtPKuNPyJe5UgTN9LY=
X-Received: by 2002:a05:6512:3b9a:b0:50e:710b:a7bf with SMTP id
 g26-20020a0565123b9a00b0050e710ba7bfmr5628850lfv.81.1704328711790; Wed, 03
 Jan 2024 16:38:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jan 2024 16:38:31 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CANg-bXCU0Y+GOf9w2j5suoq+F=AnE-NPuhOYjGtpoG3W4WT6-Q@mail.gmail.com>
References: <20240102210820.2604667-1-markhas@chromium.org>
 <20240102140734.v4.24.Ieee574a0e94fbaae01fd6883ffe2ceeb98d7df28@changeid>
 <CAE-0n50zkwZ8nguUJcL1gjbuavhSU_rLxfGhanxB4YA7N34hLQ@mail.gmail.com>
 <CANg-bXByhaSngW2AAG9h6DYHpiTUvh8+yw3LPU6ZQSCb62M-wg@mail.gmail.com>
 <CAE-0n52u68wMHJGe8=jz4Y1y2=voycFEY15keebz9tPDDBgiqA@mail.gmail.com>
 <CANg-bXDzLJgWLuH8Xj4GLYG=AVfcbmi_EfrA7DaHj4F6i350DA@mail.gmail.com> <CANg-bXCU0Y+GOf9w2j5suoq+F=AnE-NPuhOYjGtpoG3W4WT6-Q@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 3 Jan 2024 16:38:31 -0800
Message-ID: <CAE-0n52ri8S6wnSkOkT7frNi+HMVXFrmuwuvBz=hgJCfpYHmOg@mail.gmail.com>
Subject: Re: [PATCH v4 24/24] platform/chrome: cros_ec: Use PM subsystem to
 manage wakeirq
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Raul Rangel <rrangel@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Bhanu Prakash Maiya <bhanumaiya@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Prashant Malani <pmalani@chromium.org>, Rob Barnes <robbarnes@google.com>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Quoting Mark Hasemeyer (2024-01-03 14:45:06)
> On Wed, Jan 3, 2024 at 3:25=E2=80=AFPM Mark Hasemeyer <markhas@chromium.o=
rg> wrote:
> >
> > > The DTS patch would go through the platform maintainer tree and be
> > > pulled into the soc tree and sent up to mainline from there. The
> > > platform/chrome patch would go through chrome platform tree and then =
to
> > > mainline. The bisection hole will be real.
> >
> > I thought it would all get merged in the next merge window. How are
> > bifurcations like this normally dealt with? Does one wait for the
> > first series of patches to land in mainline before submitting
> > dependent patches? That could take two merge windows.
>
> The DTS dependency problem must be an exception? How are other
> dependency problems resolved? For example, this patch relies on
> changes to 'platform_get_irq()' which is in drivers/base/platform.c,
> which I imagine is in a different subsystem and gets merged into a
> different maintainer's tree.

Cross tree code dependencies like that are usually resolved by having a
maintainer ack the patch and another maintainer take the code parts.

DT bindings are not supposed to be changed in a way that would break
compatibility with existing code, hence the compatible property. It's a
backwards incompatible change to add the wakeup-source property to the
EC binding and make the driver rely on that property to maintain the
previous code behavior. That's why I keep saying that if you want to add
a wakeup-source property and make the driver act the same as before it
must be done with a new compatible string. Because the driver has always
set the device to wakeup, the compatible has implicitly conveyed that
the wakeup-source property is present.
