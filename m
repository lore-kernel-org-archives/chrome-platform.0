Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDCC16FF37
	for <chrome-platform@lists.linux.dev>; Mon, 25 Nov 2024 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732521695; cv=none; b=THtCT186dtQHVulUM3HSu/YJu02X/uflbL2djDiq+2EOY53+fx2czG7ku44l7mIwnJOzmUwZVPmJiN7Vd1cbKVjnY3GGl7OucGhbyWNu/AQDhZsDUiGIK08YPCGVbLxLgLKPwDNHy1m+ek5AcGvvYrN1beXXrPBROkVxFKN3b3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732521695; c=relaxed/simple;
	bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jR2Z0FpP0FODeKCozO+je6iiqqH4KB0FLlBUlOVYPLQ9odKo+YeNZVHF8QkS6nPthYdTmA0PMlxph3HG4ZPO00mfwhzSM2fBPhP/jL4W7ZHVGAz6YZrpuyhut3AoHe42AztcpUBjE9ByuAuvkbirIbpGmqxbmtiL35qZN+toJhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UpmuYEyi; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UpmuYEyi"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53ddeef9e4aso1916481e87.1
        for <chrome-platform@lists.linux.dev>; Mon, 25 Nov 2024 00:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732521691; x=1733126491; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=;
        b=UpmuYEyiMtdkyEzjuj4ZMEGU6SW9xZPEpQK6vAW3xI0r/UVFVBMYBpVk7MPc+P+UHS
         HcGTYqKPdff1r8MWULzt2gH/dhFvbDiZDaAe4wZg0rfWi/YYCXftedjoS5VYEjfv7qZt
         t6d5+oHm/87B8NFlWjk7OpGUjHuyuwiBsF7mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732521691; x=1733126491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=;
        b=mH5C38rya8QH2uX5bhBC16zFk63v9gLp5CIP/LTotlbKAfTkZvvBezVqqbf5kKHjiL
         SG8BfWttw2AQCD2WPoR7P08CMurLztIUrz4aAhcO0XuWAGtNzf6YI33no5Zh0DRESvGs
         JCFXCPkymdntyHR3vswCj1Hkirj9IWv1SX83acJGKhILIGdza52bQcYVlYc0g9tQeO5h
         WJTOrKacBOonbUa63bHkYIy+UUDIHBJcULsOdITf70pxdNFjWmuyR2YNjFeWbBY8MtOn
         BOt1sUIbAY6lPX6QRTCPEAnvT0za8XwVIZ1E2LW8KxIgn/es2HK/WCbsYZLVeZbeB01k
         JV1A==
X-Forwarded-Encrypted: i=1; AJvYcCUHbGXZt5UwgdWUiAi2ENWjJTY60rsvmRG89wR2AJ6v87I3GaNwdvk4xjTDQvEorDYtHpXCL8xAOZr8MRY97LY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzI6tTOZEaBey0Z4SgyV/KfYSRdS9RLkMM3zyJ8ZitaAf1J34a6
	/JGOfljzPN/FMfLTpbxFfLxV6pKjPQDpAygPDHWccqOIyWvWeUKW00qhwpSCDjzLZxd6rZNnf/U
	hZhREFaafqzV1f5XUeDLGp+Qyg7ADkO1t9Wz7
X-Gm-Gg: ASbGncugVUcrHTFqkbTt87r6zGxpEN2juHsmnsaEpKoh2v7gY2c5apxxwZWNnVCMNyU
	uCkTNyJ2WdMoC7LmhVMKETgSlpyJ4d/zc8kLe13eD7Rw1WHSiATFmBzPkI24=
X-Google-Smtp-Source: AGHT+IFNA2YPDB29CKBTPo3ULGX/2k8v0BktEtEySMJsHpFYreImy/VSkDo3YvLTyiyt5hYDcUA3UR4cYjWGNCVrAeM=
X-Received: by 2002:a05:6512:6c8:b0:53d:dd84:a92e with SMTP id
 2adb3069b0e04-53ddd84a93bmr3341455e87.0.1732521691043; Mon, 25 Nov 2024
 00:01:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241106093335.1582205-1-wenst@chromium.org> <20241106093335.1582205-8-wenst@chromium.org>
 <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
In-Reply-To: <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Nov 2024 16:01:20 +0800
Message-ID: <CAGXv+5H8YwiTyk1eMSwPLuGw5sQxec4n8OKR-Qa5wz8QGH4h9w@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	linux-i2c@vger.kernel.org, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 6:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> > Instead of having them all available, mark them all as "fail-needs-prob=
e"
> > and have the implementation try to probe which one is present.
> >
> > Also remove the shared resource workaround by moving the pinctrl entry
> > for the trackpad interrupt line back into the individual trackpad nodes=
.
> >
> > Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to wo=
rk
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Hi Angelo,

Could Wolfram also take this patch instead of it having to wait another cyc=
le?


Thanks
ChenYu
