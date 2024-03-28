Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9292E4CE0E
	for <chrome-platform@lists.linux.dev>; Thu, 28 Mar 2024 05:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711604999; cv=none; b=q9HmxFJ4epbCxWS+7lS6z1LHCxeLv08tH3dbWp7SqTGfV6/NRlriHyKWhw0R/79ikrXgvvjEBpmiWsg3FAoA8k6StuxvK1ioichh183OrbA7ArLR6WHsxeY0E3gb/PORQdO6NufvkqWVo0pV34h+D3qbvQwh9AYW+kezmcYJxig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711604999; c=relaxed/simple;
	bh=cn31nvUNUjuzpJBbAgPyDFbqbILk+7I0RyNp0AFjRSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1yEjqESFZKKl3pTUyy0+HJq8dajM+4RmwKmEB8Ues57bufOnWw54vPaEZdfkPKRLeMfCjgrsnK/gdkSc2s0vNvsvkw7K9AX3dNgoxDuMfLA/9hyC8cDSIrsk+l+txjCi88Sck0dT09KX+IsuRNSV0YghD4MyBW4y1guvS1DkL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AbE3EayC; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AbE3EayC"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513d247e3c4so582737e87.0
        for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711604996; x=1712209796; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cn31nvUNUjuzpJBbAgPyDFbqbILk+7I0RyNp0AFjRSE=;
        b=AbE3EayCkWM3X2gXugECV4hbTrWhFmJhonoIu7p/IfqHq+Y9CpYZAJYgCcZAAFsRaR
         YbaFYX9dAl5kVIkQvl0BHMSw8gjNrKk/EOCH218RiBJFpe5EHxxgivUREy3+ckQY34QB
         Ocnepr6aR4Hs+lQhReGL+fIkz4c4sWcTeJUyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711604996; x=1712209796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cn31nvUNUjuzpJBbAgPyDFbqbILk+7I0RyNp0AFjRSE=;
        b=oqxpmTrrTXBPDzyPENpF5gMSqR20E5CfJzb074nJZ+FaXnyEntfyQyAz6IxGsc1DUa
         wQEe7AZbFb+Gv5kHBz77Y1N2BKnk0zshhX6G25j7BbVRcEXU5Zp3/7Xn/+IBsz2AUO8j
         37Jii5jO9XOJVk7yJjlx/woeV67lc9rIwyCnV7h5ab6R/d/JN0mNX1xhHn9et/840LZB
         tVD9+DDGvHq4qpIKAKh3RfUxhdJv5mXg2VHw3bIe8fLaXFu0Z9vbj+LAX53qS4djrANq
         n6nUFLkHKhil8ZUF1Hfv+KWjAgrHX9QOeH51w/xEpI4J8vyZM+KKFcPxLEz9SPKvP3V4
         hgVg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ4lznLjqHEhfjKhuweY95ISNlO2O/XEKCDYUfr5i+NBOvPoOTKWkokhhLA0Cy5WYoSevpM0Ov7zqLp/gyFxxMlUdbOGJD5SGX8nEQQ6zG
X-Gm-Message-State: AOJu0YyKyimsQJ/s8EK2YtXeUDDiJgpcGCyCjmxEzEQFA/qXpRGSS1LG
	A3x+qR7D5KRFI+zFu4NRGpyjC3xwJoN5XUEIozrO0VcKu1mRStsV58KR6J3hjdJWe8s+wB++caW
	IrPcaAAXhJGms3XlQrCAQrE93n0F79O8aloyR
X-Google-Smtp-Source: AGHT+IE9E7br29oy9RDRD35SwQNl2vwFiBtmvYXASR4vX3jKO04LtgAi9c4oMgaAsLskFkIEeHikqvJMsXTcDn6BjM0=
X-Received: by 2002:a05:6512:32bb:b0:513:dfac:b29e with SMTP id
 q27-20020a05651232bb00b00513dfacb29emr414742lfe.26.1711604995631; Wed, 27 Mar
 2024 22:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org> <20240316-germinate-browsing-6865db3a44d7@spud>
 <20240316-herring-skies-6ee1d4a9c0d2@spud> <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
In-Reply-To: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 Mar 2024 13:49:44 +0800
Message-ID: <CAGXv+5HchqvT=J7_qsJMB7OthX-gtGp0E64Xfk3i3=DDX6o1=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple DT
To: Doug Anderson <dianders@chromium.org>, Amrit Anand <quic_amrianan@quicinc.com>
Cc: Conor Dooley <conor@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, agross@kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	kernel@quicinc.com, peter.griffin@linaro.org, linux-riscv@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Elliot Berman <quic_eberman@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 5:36=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Mar 16, 2024 at 9:51=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Sat, Mar 16, 2024 at 04:20:03PM +0000, Conor Dooley wrote:
> > > On Thu, Mar 14, 2024 at 02:20:38PM +0000, Caleb Connolly wrote:
> > > > On 14/03/2024 12:11, Amrit Anand wrote:
> > > > 2. A top level board-id property that isn't namespaced implies that=
 it
> > > > isn't vendor specific, but the proposed implementation doesn't even
> > > > pretend to be vendor agnostic.
> > >
> > > I pointed out previously that the Chromebook guys had some similar
> > > issues with dtb selection when the OEM varies parts but there does no=
t
> > > seem to be any of them on CC here.
> >
> > That's maybe a bit harsh of me actually, I see that there's a
> > chrome-platform address on CC, but I don't know if that's gonna reach
> > the guys that work on these devices (Chen-Yu Tsai and Doug Anderson in
> > particular).
>
> Thanks for the CC. Yeah, I don't watch the "chrome-platform" list
> myself, though maybe I should...
>
> The Chromebook boot flow and how we've handled this so far is
> documented in the kernel [1]. This method is what we've been using
> (with slight modifications over the years) since the earlier ARM
> Chromebooks and is, I believe, supported in both the depthcharge
> loader (used in Chromebooks) and also in U-Boot, though it's possible
> (?) that the U-Boot rules might vary ever so slightly. I haven't tried
> using U-Boot to boot a Chromebook in years.
>
> The current way things work for Chromebooks involves a heavy amount of
> duplication. We bundle an entire "DTB" for every relevant
> board/rev/sku combination even though many of those DTBs are 99% the
> same as the other ones. The DTBs have been relatively small and we
> compress them so this hasn't been a massive deal, but it's always been
> on the TODO list to come up with a scheme to use DT overlays. We've
> also talked about bundling a device tree that has the superset of
> components and then using an in-kernel driver to set the status of
> some components to okay and there is some overlap there in the
> possible way to represent board variants. I think Chen-Yu is going to
> talk about a few of these topics next month at EOSS [2].

That's right. It's the last talk before the closing game on the last day.

Elliot is also presenting the board-id proposal at EOSS [3], which is the
last talk of day 2.

> In terms of looking at your specific proposal, it's definitely trying
> to factor in a lot more things than the current one that Chromebooks
> use. The Chromebook model was "simple" enough that we could just
> leverage the compatible string, though the way we leverage it has
> ended up controversial over the years. Yours is definitely too
> complicated to work the same way. It seems like device tree overlays
> would be a better fit? I'm not an expert so maybe this is already
> solved somewhere, but I'd imagine the hard part is getting everyone to
> agree on how to specify stuff in the DT overlay that allows the
> bootloader to know whether to overlay it or not...

I think qcom,board-id + qcom,oem-id maps to our board name + SKU ID + revis=
ion.
The difference is probably because we make our device codenames public? We
don't actually have integer identifiers for each board family, though I do
see the appeal of it.

So it looks like this proposal is more about identifying boards without
polluting (?) the compatible namespace with all sorts of combinations
and hacks like we have.

> [1] https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html
> [2] https://eoss24.sched.com/event/1aBGe/second-source-component-probing-=
on-device-tree-platforms-chen-yu-tsai-google-llc

[3] https://eoss24.sched.com/event/1aBFy/shipping-multiple-devicetrees-how-=
to-identify-which-dtb-is-for-my-board-elliot-berman-qualcomm
