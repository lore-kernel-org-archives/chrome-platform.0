Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1C4623
	for <chrome-platform@lists.linux.dev>; Thu, 15 Feb 2024 00:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707957605; cv=none; b=FHMOLDO4ZKP4z83SgjMRyS3UWULSIsERAegA10RJZ154w4WKAnRj5LUcJ7cAq2ZzuQNohL0g5FiIWLfsDA6t/FVNJBHZqNTQdjbU+lI5/ScfSNUoNYyUXy9bwte3cryzWudrj06kuBDT87MTLAkHKIS7d9k/9TYeJqJMHuI3AoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707957605; c=relaxed/simple;
	bh=kYh5k8MyiysiewusV+Glc1Kt41gt5l9m2Lg4dhbhPyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRRVeoMuZStR8n5DM0In3T2hfPd33j82fh+zjmTvU/Zc/sXjXwbIjxbR0+QTfUJMKfAHuTW71gWDdA47oiN1rSS60mbY2AFBM8F2pw+j6o7gbgkBab+9iPwJfV3yPZ+qXrJNriqUI6lumvUPvLpRaz2JPC/O71X0IMiC8o4sEHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NxQL8pfE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NxQL8pfE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so445725a12.2
        for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 16:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707957601; x=1708562401; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYh5k8MyiysiewusV+Glc1Kt41gt5l9m2Lg4dhbhPyw=;
        b=NxQL8pfEuWWeD6nKHmOT1Sl2qbHg2Tp3dMJAhW0yeEWcXoqu+mc2HmOe50YZ39vrPf
         +Dx/+ZP5nxdptUYXLGtkXQ6fzEPMcVusOL7AI6zbxZcreMm5j6Rpiw92+damaeiqyO3n
         JOST+Ww8EfoDv70fcCJ1eKGb8Uxkz9QoKQHIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707957601; x=1708562401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYh5k8MyiysiewusV+Glc1Kt41gt5l9m2Lg4dhbhPyw=;
        b=FOG0ikpMVgrkTlyGL0ajzW2HsHqWNZ67uvo47OdSe6J/sd/wz4TpKSxIZ4n1y4Zann
         wW12tTnAPKnZLDt6fQTrOIp/AnFq6VQoIhlFZIc2soGM49NAolbdyDa+4e4SGEQ3v0TL
         6mZzZUgvv41QUTt2wMm/GVbD3LnaN0QpEt2wvsZ5NIc6YYbLRcC0i8YcV7FSYZKwe4em
         1jHIhlOI3TVWeZQZZCd3VovAsiu/Nn06dBEDzddjHu0SE3VVa/0vFCiGYkJFPaQBxFpK
         2eSmCuhFLmEcPYfgGklf6C5BZBJ0cvipIdxUaaqR3MEVWfxyRHvsWNSK8Iog3vJfhttS
         AM9g==
X-Gm-Message-State: AOJu0YwhRM8wsF1fOn5Ib8ere8d7PuAxrLsFy62Tg9VSloiJYQu1/6vM
	q7m2MRK1nNsXsLhdFKvf1LpLAgBOqZ5k2TS7QdkV8dSv8xYQG09+Tn7BGqkfh9gCRxhfby6hmQl
	0ZMRh
X-Google-Smtp-Source: AGHT+IF/5ZJ4WI7SDONbtjAQA7ovoQKqDz7lK2EaQq6o9F6BShYEvroDj0nPTseqhqYKlCswhUyW5Q==
X-Received: by 2002:a17:906:3387:b0:a38:51c2:68a5 with SMTP id v7-20020a170906338700b00a3851c268a5mr105139eja.7.1707957601270;
        Wed, 14 Feb 2024 16:40:01 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id vo6-20020a170907a80600b00a3cf8cb80c1sm31773ejc.156.2024.02.14.16.40.00
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 16:40:00 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-561f0f116ecso2913a12.0
        for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 16:40:00 -0800 (PST)
X-Received: by 2002:a50:8d13:0:b0:55f:8851:d03b with SMTP id
 s19-20020a508d13000000b0055f8851d03bmr333252eds.5.1707957599932; Wed, 14 Feb
 2024 16:39:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-22-swboyd@chromium.org>
 <CAD=FV=WovmtKFiG0OMzpus9=z8UJ+Ev3TrwsVia8pSegvjwUiw@mail.gmail.com> <CAE-0n52qgKrasAw1AbZ97zMk1xz6P4KkxNLi4cBpNKy5wWu+1A@mail.gmail.com>
In-Reply-To: <CAE-0n52qgKrasAw1AbZ97zMk1xz6P4KkxNLi4cBpNKy5wWu+1A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Feb 2024 16:39:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAcXs1hmJB_Rd42+Q3gQDuw=2L+igCyWnnnSYtqdifPA@mail.gmail.com>
Message-ID: <CAD=FV=XAcXs1hmJB_Rd42+Q3gQDuw=2L+igCyWnnnSYtqdifPA@mail.gmail.com>
Subject: Re: [PATCH 21/22] arm64: dts: qcom: sc7180-trogdor: Make
 clamshell/detachable fragments
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, cros-qcom-dts-watchers@chromium.org, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 14, 2024 at 4:35=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> > > -/* This file must be included after sc7180-trogdor.dtsi */
> > > -#include <arm/cros-ec-keyboard.dtsi>
> > > +#include "sc7180-trogdor-clamshell.dtsi"
> >
> > nit: Not that it was terribly consistent before, but in lazor you
> > remove the "This file must be included after sc7180-trogdor.dtsi"
> > because (I guess) it moved to the clamshell file. However, in other
> > dts files you don't remove it. pazquel has the exact same comment and
> > it's not removed. Pompom has a slight variant of the comment where it
> > explains the reason (to modify cros_ec) and it's not removed. Could
> > make it more consistent...
>
> Sure I can make it more consistent with the explanation. Which way to go
> though? Remove it from the boards and put it into the fragment files?

I don't care too much. I guess I'd lean toward just putting it in the
fragment files just to copy it fewer times.

-Doug
