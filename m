Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0663B1DE4F1
	for <chrome-platform@lists.linux.dev>; Wed,  1 Oct 2025 03:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759290525; cv=none; b=T2Awdj3xE/RhcNgOzzJsNyOo8+36Tjjt1gFUhlO+ILTEJsQRG3FZBjGDqfTaSQa4BBB7W7idFtcnyAx3ijb07ztYN5o4xLZvBDBixgsbTzxwI5LkpttJ6IeukUllXsp+D8K7UdTma/vHmvwD14v9hwlYvgx4BWHHdZIjfdwpJpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759290525; c=relaxed/simple;
	bh=EdNmg14enyeeRuZIuVOC+Qcf5V1I3CceI2oqzht2f5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlDhScyP/WU4sjoUu7wj2VxHqTglG2UBW0qi/d+3tdzwLsTXBPiCf7Ui9ivLrJW5CkrOnt0JkxprYa5sm5VozdAnsEPmJIcOOpy9+3EZtbD/Mnb7EYUXOoa9lLujPC3Pri9BPAbsxig1kFGPf0wD3jtppCASMYZlD8WFP4DkMWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=feiymCMx; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="feiymCMx"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-58984c363ceso515898e87.0
        for <chrome-platform@lists.linux.dev>; Tue, 30 Sep 2025 20:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759290521; x=1759895321; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbDGpgTcV4nPy99Bde42+h9SYqbXF4/JT7azRtjchCw=;
        b=feiymCMxGhRho3Jm29YwywSfLEKV6VH93bxquHxfx26MIU5LhU0Vpakojgdbis4TEp
         0fwBaQsqQJFe1S30CuT1xvxVa8uSO/Sp79SOAmb5HjauU7EY6ZCZMzlKuj59p479u4ju
         lQqgDhjQFdKp1+94YDxFQjVrEPyKsfjIyxaw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759290521; x=1759895321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbDGpgTcV4nPy99Bde42+h9SYqbXF4/JT7azRtjchCw=;
        b=WOBUnTy6WFZ/Xn4IXRDHjhiMBYODWmW55FhjTIbGtBISUrVaFfwzB7GLgFtau4idWX
         qPKv7TJhyeMXQvDXHW0mNb/D+4baLQv70oRFHllp5IWaOPH7fsDErsbSmrG0YuCDzfQs
         wZT42HNklUNTfExl7fStUi1jXe2ZcAqGIM6QD//yH3ENkMsScF7D4U5g3MhRttAXMR+F
         z4F2mX41eXKZy1VATXINe6Q6+M8cfIXfxsKhjYztl0d2LgNthjzXdTjUJUr07ey/BWIC
         Ikt8VItno0Q0qSOXElwiZgOacLFo1dlRa26qjEWaZVW7WOCsKp7QXA4aSTC4QoCsUiJf
         Dc5w==
X-Forwarded-Encrypted: i=1; AJvYcCVJf9wFBb9NF4AinCgXgKV3CCoryzrr+2aa2bdX0mJ5jITu+Jfo+Kg6pV437QEzV0tfNOmLtZNjKBPoxzGieaY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZLG18uNSAvgUSXBxUq4bXw2vEiqf7QmyEOQihlfXgCnKXf38N
	fXctyfbrneVmughOf1xtinbdrmya0mVDSwlIM72v7BBrldsPZSmkROE+PDZp+RgKn54WybBrWfA
	1R/M/cEMSdvWcvVoqIuP8F2SWLx7bBwpvygtZHVCb
X-Gm-Gg: ASbGncuwtblyGh6etK5fK+rTPzcurL1d8LlC1P0be2ZMmhv6Rzw41f76OMZ1DAUNg8l
	Wr+wyXkOIYvdDoflaSnMh3YV8ojJkOJIWqGbDRMy811nuK0iOWRV37sCPblyDtU2/e8X7AFz9CZ
	bEEzw+JvHobWSa1Rp/WlY2YPA9WGBdw+YuA6qq3dtj14XDxbW3TZGDxSzurJAPAfMOxheBfIuq0
	1NNaId4/5VSEla6BGkT+VbQfidSzF/R6ZS5hBTWKeQlWCO30Ttik8teIQTzlg==
X-Google-Smtp-Source: AGHT+IEt27GdUNuEil1oCZ0SLhwUHChkXL8gmJhktqVVplGqcGKrSSp67qADibM4PY5Cnx6ufacc+rJwkmcCX3eGhbM=
X-Received: by 2002:a05:6512:6181:b0:577:a108:93ca with SMTP id
 2adb3069b0e04-58984e225bbmr1821361e87.28.1759290520880; Tue, 30 Sep 2025
 20:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
In-Reply-To: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Oct 2025 11:48:30 +0800
X-Gm-Features: AS18NWDDl3OS7A4mcJKeQv_2tDSls1y22vmY0gN81pxraCtuEd9IP-mkQAX3bNg
Message-ID: <CAGXv+5FQSETv62FS32=eadBWwZPB_ShaJ3_P0cksnL=sdBwkFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add board-id support for multiple DT selection
To: Amrit Anand <quic_amrianan@quicinc.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org, 
	caleb.connolly@linaro.org, linux-riscv@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amrit,

On Thu, Mar 14, 2024 at 8:13=E2=80=AFPM Amrit Anand <quic_amrianan@quicinc.=
com> wrote:
>
> The software packages are shipped with multiple device tree blobs support=
ing
> multiple boards. For instance, suppose we have 3 SoC, each with 4 boards =
supported,
> along with 2 PMIC support for each case which would lead to total of 24 D=
TB files.
> Along with these configurations, OEMs may also add certain additional boa=
rd variants.
> Hence, a mechanism is required to pick the correct DTB for the board on w=
hich the
> software package is deployed. Introduce a unique property for adding boar=
d identifiers
> to device trees. Here, board-id property provides a mechanism for Qualcom=
m based
> bootloaders to select the appropriate DTB.
>
> Isn't that what the compatible property is for?
> -----------------------------------------------
> The compatible property can be used for board matching, but requires
> bootloaders and/or firmware to maintain a database of possible strings
> to match against or have complex compatible string parsing and matching.
> Compatible string matching becomes complicated when there are multiple
> versions of the same board. It becomes difficult for the device tree
> selection mechanism to recognize the right DTB to pick, with minor
> differences in compatible strings.

I plan to revisit this topic, and also include device tree overlay selectio=
n,
at Plumbers this year. I was wondering if there was any progress or changes
on your end?

Thanks
ChenYu

> The solution proposed here is simpler to implement and doesn't require th=
e need
> to update bootloader for every new board.
>
> How is this better than Qualcomm's qcom,msm-id/qcom,board-id?
> -------------------------------------------------------------
> Qualcomm's qcom,msm-id/qcom,board-id are not scalable for other distingui=
shing
> features as we need to add a new property every time. Board-id property p=
rovide
> a solution that the bootloader can use to select appropriate device tree.=
 Board-id
> encapsulates soc, board, pmic and oem identifiers. Qualcomm based bootloa=
der can use
> these key-value pairs to uniquely identify the device tree. This solution=
 scales well
> for cases where additional identifiers would be needed for device tree se=
lection
> criteria. Adding a new tuple in "board-id" along with "board-id-type" wil=
l help support it.
>
> Changes in V2:
>  - Based on comment on V1 related to challenges on designing common bootl=
oader for all
>    the vendors, where different vendors can have different representation=
 of board-id
>    and the best and exact match logic can also be different for different=
 vendors, moving
>    the board-id definition in qcom specific binding.
>  - Adding support for board IDs for all the boards that are in kernel.org=
.
>  - Adding Qualcomm bootloader best/exact match logic for multi DT selecti=
on.
>  - Keeping list of other vendors in CC for comment/awareness related to t=
his requirement
>  - Link to V1: https://lore.kernel.org/all/1705749649-4708-1-git-send-ema=
il-quic_amrianan@quicinc.com/
>
> Amrit Anand (2):
>   dt-bindings: arm: qcom: Update Devicetree identifiers
>   dt-bindings: qcom: Update DT bindings for multiple DT
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 90 +++++++++++++++++++=
++++++
>  include/dt-bindings/arm/qcom,ids.h              | 86 +++++++++++++++++++=
+---
>  2 files changed, 167 insertions(+), 9 deletions(-)
>
> --
> 2.7.4
>
>
