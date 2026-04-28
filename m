Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4BA3BFE52
	for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412617; cv=pass; b=c16hSenSPodiLa9z5mOO2HXfG23+UecqmHqnDiFltLadqAZ0O6Ui46BK9qDi++r+S1KUc1VSTNJJ2AJtCO43affcitPD8QRYmZ6SiJOTw3jUCU6U1nNcFsuoQIF+rjfTk1NdWcsdfcB1/cwKqFCy/+6f4hhW5wj1+TT4Z5WaKB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412617; c=relaxed/simple;
	bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iz3e+OObemmXR4jvzEk/r+SxQX0Mm2XZ5xG7RS55F7Rt7GrATtNp2FR5l3c6UqIaLHLvKF55rpCkLz4elNs4dVQYlmC+KKmtFNsRAMNtlMvz5hYqx2PDXV/WQ+m3BTUgWNzjNtqmEseo7kS2Seu1r3h28a25mYpjLQnQ7f0thM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gNOmBNYF; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gNOmBNYF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891ad5c074so27005e9.0
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 14:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777412614; cv=none;
        d=google.com; s=arc-20240605;
        b=k76RrBgIkXFwIMzJ9BC3XQUMYesoGRGAvRsP9ieOmHLUOkw71m8fapFsd+1dzVE8iu
         keoSX1ktgbWEiQe8uaW8bDstO3yBIx+/906IsUomzgsNZ0IqWQl1V7GIHe5R/Mll90Gs
         /VaZnnQWC8s1azmgGBFmvXtVPUy6q/R6P/G9FJHFWI8cOZ0D8TTvNzPb4uJppTQIrxx1
         iMjE9TxVjcaYbb4pc/LE6vQvrY+cNrhwOIUrDobeOdpebYcWkWoJNyQMFbj4xcZ+v2hS
         LbPtLTJke+hoDhest2c7/M7rV80I6ROLy1mOs1QoPda1Yi+O8ckduEJdsoQYBPl7leH9
         /0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        fh=FEvEn57+GUD++SF2+16dAFyaEJ6G67ZNDQ4A5CXHVM8=;
        b=UQSHb5qENqAZ5Jg/7/CwHGvk0uwKS9EOYO5FOrKp923ZNnvdiu1gkFWSICP/Ls5LWu
         x/k/9auCeq9jN1cYsd280VhijaRNcHPlG0x2oQ3w0L9aldw91ZWKt59BR/8BhPBRobAW
         rl+wHKPWIv7EV/nXfm9WYvIZ7lG29GWi33KV1mOdTRU1D37qTQIW02eFWo54f6JYqUxH
         /SeW3NaNQOyJR+m412LHfTeem82slqOBIX4wdIn4zik7qV7Oxbg9uEZwKnDgGR6T2xZJ
         cYnDjVZ1odaj2fLJAS4JhZeqJO/s2AmFF8oarCpfh+VwUkvbjHeUxV8q3NMxiHD3DoDA
         gHyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777412614; x=1778017414; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=gNOmBNYFhIOsHaAblfY7btg1K9ZSWtL7eX3i/0NiXBlMgR56MDZYie3GSFw6gMX+AM
         AFeLtS2zCcLWiFQmxen7BIoQTCFzW0NZtjKrScPelXXg+UFYOVgLngbjl3iuVoDp9fdG
         Nr/OXA0s88K5FghuRXdNiHOqCaMLa+QrlsU0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777412614; x=1778017414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=e0V+CIHot0hlbzHBayw77NbVhnxsWx0ztMAA2aZ2beA8b3klnZcj3UJkMFMbu67Z9e
         edcWxfgVs4xRD1PXQNbEWIOaW9olq44PMuOZwITPH3qeIm4c573bOwoVFQ6O4OLFUMYB
         6Iyut0KZa85/yuNjL7gNHNbw7lGJXHbJdwtBukkxC0JFUxDTGqW5O4ckGm0+fdhfnHxy
         8KHTOk1sEkeaxHBBqucRz1IeAbXAp8a5h2sIPl8T/lcoqefJtGZFzwrzf9XPQypKKAW0
         WveMAn0SfBpxTZ8zVq5tSiI5jfrJtpS+sQBQ37hXicaOydWnAUCvPuGsfOsNPp+kHf5L
         ROCw==
X-Forwarded-Encrypted: i=1; AFNElJ9ai5j+cZm3bGIuAvPndz6cGz4nxR3ewRpBL5clL3+rC3XnYoowyQiWwqZuP1S0YkrUPZ2E/tw2piV+JrEkDTM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+MiCsE6rm2hLmINezETPHyooefuC4En5rWGrafQ3tWBQYnQfr
	n50i+EyGpdEE9xxsbiPgziZnOZgqr7LzUC++mb83ZhwJa7/DMumhwuFHSPYBwkJUMggsZBwlpRJ
	vrPtNGl7Ywo+IZa05LR+jSUXjxT6Zlf7oc5Qa67oa
X-Gm-Gg: AeBDiet6hpko8b4qM464KJoPAIqTzY7IyJvv4Vne6NhhHKU3rKn6G1gcRzlq8jGtUSP
	+Vwc/oUdifN9eCRQJqTeW6xAc3hawryUWD7VICYUVxOZz0lrfQf85VsIGYtQZo4OAuvGRuju1ZG
	3B7mgzGnuW/yX42Yxt6vLYwc8ktK3fs5Yn5aQ4swBniLfplJ0XmNPSXsBV6xQTfEu9kacch09qF
	M/HbdAJAbxjKQMAMMj/tgfuEz7RTt2WrUfwgePA0dOB0IISF6me3wZgfZ3AyukWQQqprbVTB5qK
	5dl8zMVDfpyg8PtPq/J27Vf2++uxzIHWQYcpqyiXycr42WI9XSCVq8xUEw==
X-Received: by 2002:a05:600c:530c:b0:48a:5f32:62d0 with SMTP id
 5b1f17b1804b1-48a7ba07d5dmr322355e9.12.1777412613805; Tue, 28 Apr 2026
 14:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 28 Apr 2026 14:43:21 -0700
X-Gm-Features: AVHnY4LgrR9BMoyPVl-dbhODH2S76f3l5WcQRNgpXekO-MzmQp39W8EwHdrUnso
Message-ID: <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I reviewed Depthcharge code history and found that this problematic
> bootloader behavior dates back to at least 2014, with the Tegra/Nyan
> device. Older devices may have similar DTB structures, but I'm not sure
> if they have the same address-cells problems. In any case, these changes
> shouldn't hurt even if a device was not affected.

I can confirm that Nyan was the first Arm device shipping with
depthcharge. Note that the Exynos devices are all older and shipped
with an old fork of U-Boot that probably handled this very differently
(I believe they had `/firmware/chromeos` but not `/firmware/coreboot`,
so they wouldn't have had a `reg` node and should need no `ranges`).
