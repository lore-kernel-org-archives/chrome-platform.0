Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B20360
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jan 2025 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189470; cv=none; b=t1UdoFqsoFMQPIOkaWxpcARYam3Bcp0PtgKAcB8wmp39cEExrqOZq+JocIEWXJjbbkrEcyuja2UGofSg6DWEdoS59KNWQ8SP5N0mc4t3c3j7yH1VoTAO7Ar9gHTjV4xDhBSerqUCwp4ppOtJDMAfMoiH4IGr8dtDcA/gQD7Kdm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189470; c=relaxed/simple;
	bh=ol1OJ9C87LrwPGOr1RDaMBVe7xFxY9O5Ib0lXdvlOk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YHwOYdAkb9skFzy+tNZ48XvMcEjKsj9ndmwYpbRcTkUuhxL4ULEccnRO+mN+Pt3wne09jtb3NKTarWVDbbvUHoBjvFAFOXZhwkxKbZ02h7pDCIOCcgqMdYzWWBprBDbr3uBAmF+XGkCHHLZl//Gjg80H3WkCO3bWJivXLuSXkro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U4pfIzIC; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U4pfIzIC"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5189a440a65so8568893e0c.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jan 2025 10:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736189467; x=1736794267; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol1OJ9C87LrwPGOr1RDaMBVe7xFxY9O5Ib0lXdvlOk0=;
        b=U4pfIzIC/8FJHvsx6Jq0QWX+1YzBpRN57er10bMG9tpQOKeyBgkwMuvnQMN7HoSQr7
         NOD0UD9Eh/5KOayNxWwl6cwe8tP2nFtvFyany29+PjHwIZBdfzKvRDJ50FcCMX3qGxlW
         /CZiHmwYfbT6K9uF7PLIZFu0EJUyZQsMqj+yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736189467; x=1736794267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ol1OJ9C87LrwPGOr1RDaMBVe7xFxY9O5Ib0lXdvlOk0=;
        b=ByIwfnX6Lnp5w3MV2UdNbNEZ2lfai+y3k3kuyvT6n0iZcOJJC4omMyOBOPyvpYdrVP
         mx3qtUIMZq6LEDHBjtPC4ONq8o7QMs0BR604TQ3X547Ln6NG7XeVFiOMFCEYp4XnfBFV
         gFAnQj4GFA4cqvABtfRioTGagz90Ln3F8Lc6ceVhoVoapVMrmXbvTaHJo2J26s+mH11N
         iMtWnT8W6m5IM6rBEdZMmHz/TFVY6dcCfRaLnWYVhP+UcNMPfDBFXKItodXWpSS8Rd1i
         CRR/skhkZ5Sxywl8GIqrf+Ue36KvhfoQLcu64wT1f0XlMa44gsDlZkZOQEf15tw+ezHr
         h5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQuNrz3+rzmk4QWI5TuTY69p9SXdaHHlfvtGTb4BBH39sVBgf+VDe3DN3PMOltProarsJZiIvNbfzEksxWrak=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjD9KNo446LjsA8MVAsV3IQXssiPhz+UDkWQFRounhZNltBaTG
	8YcS2cxWcW9//r6kJEsftiGTJVcuexdOvvh9VQ6BXICZ3Dl+43LI48IjpJMuVt8KVEFmbyfpkbw
	GgVZcfqAQWbZWZysAR4xkCviG77LyuNUPz0/rZFFuHXEtI9w=
X-Gm-Gg: ASbGnctaNmRdNl3Wf+8RAWb1zq7dKNlAH2Hc2uOQCd5rKgH46ESpD3Y3lRYbZL/If4E
	4uT/cVz3COFxwtv13iiGZ7NLjPpdCEUq+MSDnjiHSNXVb+OBPpUFdIkim/cyPjQ/unUkCg+U=
X-Google-Smtp-Source: AGHT+IEPoyvsaAznZXU95dycBe2EoTxUeB8WExHLy5tQ6zflADba/Pz421yUxqmnA2ePk0ERmtJTio0fZH48NHpwvAA=
X-Received: by 2002:a05:6122:3209:b0:515:daa7:ed0b with SMTP id
 71dfb90a1353d-51b75ac3e35mr40358489e0c.0.1736189467797; Mon, 06 Jan 2025
 10:51:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250103001950.2868856-1-gwendal@chromium.org>
 <20250103001950.2868856-2-gwendal@chromium.org> <Z3uA-CykCvOArmU_@google.com>
In-Reply-To: <Z3uA-CykCvOArmU_@google.com>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Mon, 6 Jan 2025 10:50:56 -0800
X-Gm-Features: AbW1kvZynEq67KeAv_rLRtk1Uj95oOEW_DjNVxwAPuxYHFayta_jcE9qnErBW5Y
Message-ID: <CAPUE2utAhEkN5t7zTrfY-n00vbiC4fb1B3qmwtymOeMav=ZnmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec_lpc: Merge lpc_driver_ops
 into ec private structure
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev, dustin@howett.net, 
	ben@jubnut.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 11:06=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jan 02, 2025 at 04:19:49PM -0800, Gwendal Grignou wrote:
> > MEC support still uses global variables.
>
> Is the sentence redundant?
I wanted to point out that "cros_ec_lpc_mec.c" still uses global
variables and assumes only EC in the device uses MEC. Removed in v2.
