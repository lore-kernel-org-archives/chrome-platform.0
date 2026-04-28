Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBAB2C08DC
	for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777414561; cv=none; b=bQOuHnQLPXBAXVW15hQC67LHgDKQg5FcdWEjmLlO032BX9sepbHzPJhdGVsiRQbNpiRxs74qDj9+PQ6Xq+zU3z0M/fGDBre2XgwhWh25/DGA89BJtoaKeo07sEFjtbk5PdukCt6FjBxurXBqg75KUXM+y81MeldERQ35HKpomjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777414561; c=relaxed/simple;
	bh=YRXa3SqUBnSgR/YtBhUZuZAmwoEQPel0vDrvl4dz9MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7kjZah38E9WQZ7WbuWixEj96YsZv03lMPV7sgdFckdvBdE8yOoxWfviTEXlK99GiUFLTxOhvAoPYt+Q0KvI8VQLjscVBWDD6boPJxpFrbBevS0MkbYx+CaHSkAI9YkmuXrUOXT8SXGvb4/lxFbtipKyj8ynwhuCT0GRVzASWwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MCa0ZedP; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MCa0ZedP"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2e221a71e19so12019705eec.0
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 15:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777414559; x=1778019359; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IRuOpUnKlyxobyVU18RBjJjL20LQKeUc7Tn5BEfMoeM=;
        b=MCa0ZedPnHVe+FTurevCoh0aTTb9mFbNKAUydDlD8GjlmCnaZcmcCvBb6mV/P5N/Xn
         MXWKGt/iiEJJ62BrfMKdKBKS9e3/jNDsIgrtMxoPd4WmUsX+3X+XBATmJaQWamWUohAd
         ZaiZyxNuE7p+zRRWqouRCOSBVy4LOHzzlChm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777414559; x=1778019359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRuOpUnKlyxobyVU18RBjJjL20LQKeUc7Tn5BEfMoeM=;
        b=Vj1XKbBi+TrGFKjvPy/YfwvWHUs6XDpYRUDNmk1zy6knmpKs/DE3flbYv3gOVizuDD
         6Da+8jjypJGO2TcnjfMP1KvzxHHJR3kYpOkTrreOmohCKtwUBYCBFaStKLQ+8m3ZODvR
         cDnDZL9evf4vB6A1W9lblPQks3cDWHrWCmZviqZ+EB84GcmKirzkSaemiScetNQn+XuZ
         X+3LbIJdTq97fhZblxRwNo5NAmzB+VPpSuDUSVs/miadtadUkwZ5nhUb8nhpBFO5U5YS
         oYv0TfNKWmn2rD6MdJ3nNBVCyYx57r/z1AjiobO9i4hgNEqY8E3yEExZJisuC9vdRcV+
         RZTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hbKRCEDdMmdFi7LTs3tVIsRcL6LdIDja7+J8Pvb+eOpLYZGeHC6W+S+GEUMP27daB9NCseo50d1I0CI5qFyE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq8CIayGSpo9d1Bh5VxfyfFMOZyTM4aSMo+hdwCFnaq0g38dzY
	efAkKoLqRPR6dK+8T2u5pFQmeKnDaoksiX8RjwewcSaqj/FxANZ8O/JjqIZ8TaigF8sWZK6ArJO
	2kJM=
X-Gm-Gg: AeBDievUUiWiLgEs0vXFpuooCKa0xeLsG9XQWwF4wXBUyZB9ocqoHtCB+dC8lKefxws
	bBr+Y74Xa4c8KbOrLCg8reMtiPF28Wq3XB5v55wsSKdCZyuq/0nU4g6M/18VdB7vMpo2NmN7lX8
	NQ9bx8mshSBkLRxts5XQqgKSFU3vu/yN4a5jNM48p9Wm732I8uSjCHccxuz63UB05yYY1QOJjk7
	o5TDBoUe9gLspOWSVYHzeAugGXLAfBFrKwGr2+PRmXS6F3Hw0EASeTDW6OQI9wI9+A7tY9lqURj
	3/NG7eTQrUtWNtKgzgnYhX/SKeQVzCNh1Zqam389aPnxQk9hlDe/x+joSJX0Era8pMzFcE6eHhb
	X1DGScwqJwrh10bSwlmZvQ1SYzFhwjanaOCadvkjNwJYHlIAi9a4Q3YWRHjO3c7uphw/MfRkBRJ
	aWpw6n+eJyRIbnesVAhfadfIHoPyg96ZGhFKmybDL9f13AwBpJAYe51qBSM36rMfNFesOW89Uy
X-Received: by 2002:a05:7301:fa10:b0:2ed:75d:fe40 with SMTP id 5a478bee46e88-2ed0a084038mr2613645eec.15.1777414558981;
        Tue, 28 Apr 2026 15:15:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed1c070523sm162156eec.19.2026.04.28.15.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 15:15:58 -0700 (PDT)
Date: Tue, 28 Apr 2026 15:15:55 -0700
From: Brian Norris <briannorris@chromium.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
Message-ID: <afExm9HeB-FMmP4P@google.com>
References: <20260428200712.2660635-1-briannorris@chromium.org>
 <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>

On Tue, Apr 28, 2026 at 02:43:21PM -0700, Julius Werner wrote:
> > I reviewed Depthcharge code history and found that this problematic
> > bootloader behavior dates back to at least 2014, with the Tegra/Nyan
> > device. Older devices may have similar DTB structures, but I'm not sure
> > if they have the same address-cells problems. In any case, these changes
> > shouldn't hurt even if a device was not affected.
> 
> I can confirm that Nyan was the first Arm device shipping with
> depthcharge. Note that the Exynos devices are all older and shipped
> with an old fork of U-Boot that probably handled this very differently
> (I believe they had `/firmware/chromeos` but not `/firmware/coreboot`,
> so they wouldn't have had a `reg` node and should need no `ranges`).

OK, so that makes patch 4 unnecessary:

  [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to Chromium-based /firmware

If I respin this, I can drop it. Or if it otherwise looks good,
presumably folks can just skip patch 4.

Thanks,
Brian
