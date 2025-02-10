Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99CD2586F3
	for <chrome-platform@lists.linux.dev>; Mon, 10 Feb 2025 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227840; cv=none; b=IvLptwHJpN6iUSVwonaerBhfmI7on/p2KcTZ3lJxx8yKx2od3Dpx7xMG39LoTLmclktdAKAs6qZKktEm8EFo6VJ8/ZSQQJTJQpsyRucd9tv+f5w4/xZE1ageStVv9rOSxWUddW7dRnEO52kQlrTWfNLFDoYyoPwJKl0QMH7/Pbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227840; c=relaxed/simple;
	bh=5zbZ0mjlc5mJspBqAdHsl+XIcsIzXXEkeeddcLU17Ww=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdjbpvnKGLpMe//7okCLkaXO1qT+fy8Nhp4Kxa4MmX2TW+n8WksdBJRzOJVf+COXV3YpIDk79jGx+e/VKndlvpg44+vxFAnKMwwYXl8b546TJt9QM1BjXVgk8RMXG8FT5bRynlURBX8Hm66r/k9yAfKNzPisRO4+7HKHc9kmgHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E1qdMQUq; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E1qdMQUq"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e45af17a2eso42160626d6.0
        for <chrome-platform@lists.linux.dev>; Mon, 10 Feb 2025 14:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739227837; x=1739832637; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zbZ0mjlc5mJspBqAdHsl+XIcsIzXXEkeeddcLU17Ww=;
        b=E1qdMQUqp6Dith9ATmZPlZ2Uqh3ntG3DMWEib01Fw3L5CIrOpijSNrPTwAG5ygfd/C
         ZMZXyEL5IDbGt0SV0xFtk4FOG21hSGUSCmdFspo0fU+tjGubCbRXEIiPnenKhqjwOIzb
         5qSdghBExZ/2qI0mPOVTuuh9KBr/PrDTkaz0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227837; x=1739832637;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zbZ0mjlc5mJspBqAdHsl+XIcsIzXXEkeeddcLU17Ww=;
        b=CNb5vSnULUMGcEFD5Pwo6Ea10fMXdGO+7sfzDIVSSMLhXEgg1ALwHsACoR5ikYBDMj
         /blIi4uhCblusuEk6J+rLR92K1/U7rrW/pBfZi43gA/DuwoGgClZG/YhuP2XoL23wz1J
         F3X+bxY2AKngrAXxuYdc+ifnZ+wCpL3YFnGHCmPZPNNqh6h63E0d9vmqE7qy91juG52Y
         8GtFhFwTIetJIBM76pA+zboSc6UJtdkwaKXl0FkDj5GKyhAzGzfgK8EO4EU2kMvw4AyW
         +KSEbgJeq75Z7cBmWmTQrxmS34NyEPAt6kO1aMLcox9P7xGDXF8K7sSuMArwt8Vr3ien
         PmXg==
X-Forwarded-Encrypted: i=1; AJvYcCUCYNtwLsPxrJfNXya56P4JtThLLO+VgKSzoRgNicrniHyvieKpj0xBiVoWLNmdZZNAQvCZmqX53jVJGUnmIKI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYeqKvh4ILkinH2Wxx82506KES7MDBY2tAHXuNA5i5mpwkzFm+
	igsXNO/zXex9OyovA6SIsdhQXxDxdrvWJ2nHZ58nzSSV6iMzB+vh2XT5ziZZbtQ4tI2bvbzgVfZ
	UOvq/BO4Sui/a6EnJpkZufEng/uwahTL/ENFu
X-Gm-Gg: ASbGncuNpNn1d4R368F+bLYovBI6uke45S4d/9C/FZyky20OLzZKOhV7jf5uYW+LTUm
	NVVKPi33d9Cz2XvjB4iEBSx1/wEO0kvg/MBa0e86ntP2qcQ8AVzpneWuqdP6msmTO9xZds7APXu
	SyF1/sII4Jyw74041zLfOdViN3
X-Google-Smtp-Source: AGHT+IGL4SmQgIAC10xipCYbVaexIQbpQQDDIqhx2hGeOo7wq1KUJ/UwijMW6vgDIGzhCGOUFwEwrakNbbsm+km09q4=
X-Received: by 2002:a05:6214:240f:b0:6df:99f7:a616 with SMTP id
 6a1803df08f44-6e4455d2fdemr247845286d6.2.1739227837669; Mon, 10 Feb 2025
 14:50:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Feb 2025 16:50:37 -0600
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Feb 2025 16:50:37 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87895166-659e-475f-99bf-5791a6e1ac3b@oss.qualcomm.com>
References: <20250205233016.1600517-1-swboyd@chromium.org> <20250205233016.1600517-2-swboyd@chromium.org>
 <74527323-31ff-4ed0-b19f-e535f26abf2b@oss.qualcomm.com> <CAE-0n50DXcAXQMaLtsamvxHjUrkJVBz42G6gtgKgW9Rh=qd31Q@mail.gmail.com>
 <87895166-659e-475f-99bf-5791a6e1ac3b@oss.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 10 Feb 2025 16:50:37 -0600
X-Gm-Features: AWEUYZmtYYT334_kTXnpfDawnzC3OarpU1PJNDWzV_jXYgahC0sPCiJwqwU3_-I
Message-ID: <CAE-0n51zc65GSm5J9TbHe_g4reos2h_iv-ozMU6CCrAuOt3Kww@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Konrad Dybcio (2025-02-10 11:09:57)
> On 6.02.2025 9:43 PM, Stephen Boyd wrote:
> >
> > Do you have a device that could use such a generic binding? I can't
> > really design something in the abstract without two or more concrete use
> > cases. Coming up with something generic looks like a quagmire, because
> > as you say the signals going through the pins could be anything: i2c,
> > 1-wire, etc.
>
> Right, we can't be overly generic either. FWIW I'm not standing in the way
> of this patch getting merged.
>

Ok, got it. I've renamed this to google,usb-pogo-keyboard and made it
keyboard specific. I'll send v3 shortly.
