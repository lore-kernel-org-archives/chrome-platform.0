Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D570E3D54D
	for <chrome-platform@lists.linux.dev>; Sat, 10 Feb 2024 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707565890; cv=none; b=M8IpGtxS5DWU2d9ciul5XUuA8ynexHkMqZBRYx/C5yRgcCOydRHuvBhA5AAcVvaA8zG2aosyDn9+mhlleKobPNbE91Oa3JpQPlDzSwtETGStkDj/WoiWW01z7JGDwrED57eFPtHqNIF9TFCILq2FRa9R5+ai5azF/AkoS1S/x8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707565890; c=relaxed/simple;
	bh=d2bhTf4Z57WSx4lUzzEf8y7rKj3Hg0um3/bM2pKPVCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9w+7yFpm7MpVl+UEIUNc7D4IxLguP4cI/XHf2r7kFxKgMhNEC/kBh5Ly14OpOJ8cvli8rPAQkkQFfVmV8AxP7q+SJXn/Ma8nJvXFxS7MuULpSX4QNmWi6v3ua7Fp9+SOdRj9MhJhsSd0rWwAZ0ovJfmnpVzlwKscsFUh4Mz0g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dkNAsj4L; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dkNAsj4L"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so1674884276.0
        for <chrome-platform@lists.linux.dev>; Sat, 10 Feb 2024 03:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707565887; x=1708170687; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n4hzqQK2jDc7gwYXhpJIcj9gdQgitPUMD4wx3zzHzg8=;
        b=dkNAsj4LPVDuy5pE+STkRN9hSAnlUannkWmxcqUpXxSJTJwIdVGKyDavAvge1xvfB9
         nWoSuz9hSyXnX/k7Rk6F4gk3MtWwnyPl2WjuDfyOsJtb7oLmW5Rt2TwY+zrTUXOM+NT9
         FZKkfc7N+Ji8MGpgwoZNGkWq1ZljxCkIcHVUf5fWwkiXZN6J6rPpS8ESxXbe903AYElX
         hVsoLAhuGJQlhfXOVa7lB+w7ndR5IjPy0bObpLFdCOxri0EGV+dSENlKk8sRK3KvGJtE
         kbLsrSBE5sGGHYJztmqaK2moLFL3WJXvJmA06h8mbnZgZL5hhQx7wbO0EemcSTInm/fZ
         0iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707565887; x=1708170687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4hzqQK2jDc7gwYXhpJIcj9gdQgitPUMD4wx3zzHzg8=;
        b=dZ8Zn0yWMCvZaKryH5qC2XMjn5fTgtN/6FcOxcNblyx5V2ecMxlQRfSkEF2b9oz0ZH
         4S8YhHY7BltDqTHUO5dPw9/mkkCdPdRC6A/9jVChKhMR8dhrpO6Q3XcdJTjf8LWVQ3p7
         6M2+Qo0tOWMwtoqWynDMC2OHBBcgKrpGt2dnxZ8z7YNSxKuFYmHAxJ6YQhL1ey/2nJ0c
         HTRjRjoHsUI1H9ey6RQycTUy1IcTUMBnv16SoO/qnMlt72onasFqd5kCen5XF1fHEXb6
         OoaNJ0w6Sufj+UuiiqHnmpVBUQEkM0HmscRAnPeBG7WA3gOKtfWKAGVeeNW2w3iNIIFJ
         6JTw==
X-Gm-Message-State: AOJu0YwELUAdw805rjwMNu0Ww3GyVZB8lYqBhh5LUGO9jjjxA2csPViU
	BSosh1Ha9D6EMEqs+Zg1fVpg/mwKWu7YmHC9Z3EuCJUrJJF2itU+Zsz5XZ6QJzJ0PHqwTm4B0uu
	51L63FNqlVrRri9hriuRD0y25uJEsc6GqUEbh4w==
X-Google-Smtp-Source: AGHT+IHmuc9OItSNKtDEBBJS+z3L3A0n3p2TRNTXhKRlXEx8mZXeoTapnJ3NEc5+DGezVvje2FB644OYHRQtnMjnuYE=
X-Received: by 2002:a25:ab8f:0:b0:dc6:ebca:c2e8 with SMTP id
 v15-20020a25ab8f000000b00dc6ebcac2e8mr1458918ybi.5.1707565887676; Sat, 10 Feb
 2024 03:51:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-20-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-20-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 13:51:16 +0200
Message-ID: <CAA8EJpp2wqK3vEkU7Y3BxUKsSn11B0-X7LNF-w+sJ91bPTAVhw@mail.gmail.com>
Subject: Re: [PATCH 19/22] arm64: dts: qcom: sc7180: quackingstick: Disable
 instead of delete usb_c1
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 09:16, Stephen Boyd <swboyd@chromium.org> wrote:
>
> It's simpler to reason about things if we disable nodes instead of
> deleting them. Disable the second usb type-c connector node on
> quackingstick instead of deleting it so that we can reason about ports
> more easily.
>
> Cc: <cros-qcom-dts-watchers@chromium.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
