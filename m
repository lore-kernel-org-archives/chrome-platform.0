Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E82F3D5658
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jun 2026 17:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780507422; cv=none; b=sTqc5s4sZAS8P6Z+tCmxPWRlLbp5iinNU3Lnx8YWlZ/mFyCU82G0sNTPC97N5QEyuW/x+FAjfbQIFtsmgUpRjEDzQx6xPe543Gg2AMG21EIyCxDm+F1P7AvfGDGdWtuArybl5m/Tcvbm06h0xgINjpz0ngIwsHua1bAYAIUpgTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780507422; c=relaxed/simple;
	bh=ZHGFNjdms5o72NHG5mqWdI+YKiAUtQqIG0qM2Nu/sBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVadXrKa8hc5ACY5ajrm6EBO1dx1db/J20cNE9GSVJAlELF9Tm64WUl7sjq0j/TNnSCHXogsQ+nu6+1gAPx5xJmO2yVJhDPCO4I3JeKnuEyOdlaLt0slP8IqTmU6uhqwA7k+aXOkdPD/qrROhGXiO7ZnbHaK4gY9LnRRPNjxgpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EwdVS4gF; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EwdVS4gF"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304f0039c02so52072eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 03 Jun 2026 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780507420; x=1781112220; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SrzBV/CHeC4K43UCwv6a0kN1Tfy/GhWE6NmP1fIYMXI=;
        b=EwdVS4gFGmBKTTfqeNmQHKsf0mB38bNZb7wSewGXtZVNbSoDR0ZP7WdV96/BTSmB+J
         WjfAt0rRjFIg4utynJ4l1v1gUt99V5x/asL0RvMbiTbvIRc7HHxbNYTKGMosqU53cwKF
         NNWMIKVBaVU8kEQOoAx2tFQ1VxdXu8X3V+aiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780507420; x=1781112220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrzBV/CHeC4K43UCwv6a0kN1Tfy/GhWE6NmP1fIYMXI=;
        b=LEsuzcZBfLdLlYLWIzhxwcM3c5VZDfAz6hUKZSL5f8NPJMfdRUw5q8hrNEkZ8TYah1
         805YDYtacawOUOZT967PfPubiwOnFE9C3N3pwauQEpaSAXXHjN5d0kwdOdEtmf6yqd85
         k4SDpCHDBuKZtG2J/PE/h/WBwYdqSXcf84RTsG3uM1Qr5qUyJ2ucYZOPv3EPbOiyvyqj
         cwExg7GnkizDybVR/PiWkWrHnF3lTaQ+xQCWib9nDNcbcAsVFUC17x9O1IoViZSxl0nH
         /0KHIf5wHB8RHkLpPsqAWOSx8wdYIZwlGWLzYpHF1v6/BjQPpY2+Fz0tLV1WYJJ9pzDC
         RjkA==
X-Forwarded-Encrypted: i=1; AFNElJ9YR1G9KkbLHDiDsqhxl0rbXzLkF5gKys4jTNnpirmvdsTTokMgeYVXEB3vAzvz8vbT0byXgTadB/K49YRHVls=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhyVN0i5HquXmYlpDaGFXj20ODbsirl/Xpe+C6li74OrLR816N
	6DBCu1FiMW9zJ8oUUKTfwbBKBhWUMt86NJpsD/Wa8guojmiR8n4TN+cATGu1hLuDiw==
X-Gm-Gg: Acq92OFCPjwtLcfC9EkhfAPeTamdtbICrystpNArLyPzIT53oLkC2Q9VU9oHzOPUIu1
	qfWKVvgA5kqcCDqCEk2SfbfipcqY6ewyJZSSPG4kw5Iky4Svmko4uqpo55xSxFdCCVHFaDaUCN2
	8PMiV2vPCCSHgmWc4DG9/OfWxDOqwBCzaUx4puXLLqYeBqoJ69rhxX1hewI/tviK5omlKfbn3Nw
	9uoeLgUCWfMU1FSovqllegBVDa21oY2z3KqenwSFoliNqn/zFEUURpo8yIctEuZ2+b8Hf2nQFg9
	dHoYwuKwBaU2NVhwbdnFr+IkFXd2123T25C1PCJuDs7yGkXbIUW54R8hRBTSQCg9BJzoKomUU87
	PYekwjiJ4Ev5nrqBsm3S0BoAK9dJzHDtdxJR0MJ9Ny3lb8oXoGlN3RbtThBKm43F9QaswqtK7ar
	hM1btdwGUsw5/5rx5UczensHlsky+j1xTp07hm7iJfsDbcqtdA3wYLRjP8pydllWWf12YJM4Ro
X-Received: by 2002:a05:7301:128b:b0:2ea:b7a9:580d with SMTP id 5a478bee46e88-3074fa80739mr2310951eec.9.1780507420313;
        Wed, 03 Jun 2026 10:23:40 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:c444:80f4:5ace:a65c])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3074d9fde90sm4323779eec.0.2026.06.03.10.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 10:23:39 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:23:37 -0700
From: Brian Norris <briannorris@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	Julius Werner <jwerner@chromium.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
Message-ID: <aiBjGekXkr2nIf-w@google.com>
References: <20260428200712.2660635-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>

(Trim address list)

Hi Bjorn, AngeloGioacchino,

On Tue, Apr 28, 2026 at 01:06:52PM -0700, Brian Norris wrote:
...
> The /firmware node has an empty 'ranges', but does not have
> address/size-cells.
> 
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
> 
> [    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22
> 
> This series adds appropriate #{address,size}-cells to the device trees
> used on Arm Chromebooks to work around the problem.
...

> Brian Norris (7):
>   arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based
>     /firmware
>   ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based
>     /firmware
>   ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based
>     /firmware
>   ARM: dts: samsung: Add #{address,size}-cells to Chromium-based
>     /firmware
>   arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based
>     /firmware
>   arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based
>     /firmware
>   arm64: dts: qcom: Add #{address,size}-cells to Chromium-based
>     /firmware

Patch 1 and 2 (Rockchip) and 3 and 6 (Nvidia) are applied to linux-next.
Patch 4 is obsolete / unnecessary. That leaves patch 5 (Mediatek) and 7
(Qualcomm).

Bjorn (Qualcomm) and AngeloGioacchino (Mediatek), any thoughts? I can
resend them separately if that helps somehow.

Regards,
Brian
