Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4989E3E92AF
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466627; cv=pass; b=PLSlNb2iO8OTT2ThAi49YHoUKy2CRBY+xi8jVOf3LuqMcMxCrqt6EAK47sfi43OpDm5h5sFlYmP9V1K+06K0E4XT50U+COBY7+mOz0BgfnQim6ezxky+q2jd+kfYwOiuJEbQ+1RS6Kuve1+e+Al7RBso9j35hnfWqdhTQxpcISs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466627; c=relaxed/simple;
	bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgC/qIUXbfUfMmMH6EV676hUOlyqoFToelm1tgqm1rW/kbDceOqX6ooCr0yYIkQ9te4chwutSuBxY1mQUMUndic+o+mq0fHQ69nKM2N6+HBF2BLRMPyRdZL5/VRE37PgGmSRsdUZZMQUsj4gA3caQhu1ydlUfiJCdWZhM6cuEUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRwd9ILc; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRwd9ILc"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37df6d9ec2dso342378a91.3
        for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 02:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782466624; cv=none;
        d=google.com; s=arc-20260327;
        b=l5MEOh1Q6Z9wSfcN+KGpx2xFKyuP2fzWBstKK27sPLn+273CXD5VuCdIvp35CQl8YW
         Qpj/zH0bqjjfxL3un0LLwRMYbRbn4dd8+THqx9NevnE/aeCuXghK5mRRAwJWMt7Ay+D5
         jsCdsTbi6RJp4/aG2byD4zPA2W/eUxA24v2zvxkYTCOEImu5ylbDckPBYvNaSEIyhDJX
         Qgxqr3e1yCf9sjgj2f/RWYE5ICaWyGjtE13E4u4Ep4gtC1X7exL5gpCYd3vUegOmlZe8
         tYPeYGHtixlJ9yCR46loQ0u6exuGsH5Kd4e2F7KIkpvgDGLkNKlNe7rFVDcmfwLYjufu
         Ajnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
        fh=+OX713QOFsAHlVhi3+ghDbtmX/4udBS8re1VYJx8+ys=;
        b=JAQ3H6fEA7YPMVG4SoTT6yVmhYPBlePIt1GnPZvjXW/cvCvULHOC1g5l+BvlSTcMqG
         EiMlCzqzi9AOrx1Ri8gp9LMMJvZPh1SjEvKI5aipEm+1NxGCoXZxwTLYezWDI83mG3Mn
         gvPhPg7zI+2SZIxGdhawLwRY/EE8rbk65L3oBOA/uP34Ej0PdWOABJdsVwcaX5iBB4Vn
         LeeqUDq7+glzhr5n4Xc6Q1qgD1DYz1UkdBCjkLFfj5rRWtBANmA4pwZQGSYY3rfGv2NB
         sQhc2XP73aNOxcnKZVhxzFEDaQ03a9mJmEnebn03Ou8udb+7ZbunC6wQS+0S4AUk+ye1
         RJBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782466624; x=1783071424; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
        b=hRwd9ILc9t6/2SZqZSBGsRulKuJolc+BSl9O9fp9/WHJw7XTl5qBKsIRR/W33NQWbu
         Vn1VnJlD7j9B2dPbhjadDqO6n4HDPKtUse7WaWSkJLQZrdpSYb2r4Aeg4QV4bSZectu1
         osNahlstdKGcii1hXCZOuGkeNFrEMdbZ2W9rZYyNrOIgVZEiPTHpDiJ07F45yO170S3m
         TIY15wPl9WgNjQVtIXnnLqg2ptDPqDYIuLoxWnZRe7a1wUSqgqdMcQNdglzbksHVRpx0
         iMqesjhoJFbyTy+YvkmNDcUE3gENwtP0XIJHzvqCfamT+bitMgv9ZlHe3UwIq8/RT+6R
         YxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466624; x=1783071424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
        b=WbsZlTi2Ml25deyxxbS/ycwbVw/X2Vip0plLjA+OsIMNvCH4/20FDYwnJkidMFmhxl
         58cQ1kQS9UUtvXAfrpXLmOAyBlMH634uiOgqmBnz+4BO40OTlvh8CDVzLCzvJ9mDc/3v
         R6ccRFUeDZTadIOs/T2Ae90RXft6t+VGlJeByZjGoSCi+J//o02CsWfmmlVGbREBhSSX
         yQqhrXRJrQK/1eho+MKG/GtCbg4C9Slcts+c4SAWO0VW9lx9qn8gi4ILsyQ9NVYOD1zU
         1vptHu9XiC28iiMCpkmg5l7pRidsWZi3dZRWTYoeWM88RtxCP+cEAYkiu+ETbhv7HnuZ
         EuqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr26PbYDHodDWhRVGuhYH1G1P9XYQ78kRjVFYHsy4WlMsomT6Ycm3R+pGBcBzjVqbWjr4RCRi1D7RxgHeYd2Yc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy40OMJT5b9n94D/dPP/JyaIiTuxHEKSlrg0koqjnFJCV9Z1aVQ
	PEbPRmAKtLIvBNjE0adJMlg3GZKfNoj0tSoy907mKVWCBWHpanlUrD8DEYWQ0GNl0R4OaxS1x15
	eT5uxmIVhQ9fasTWY0QJ5X4PQjN1JWOo=
X-Gm-Gg: AfdE7ckiwgBig+ApFdfAfUvHfAEFdWwHbrxmSavx7h9ZxAMRRO7sMQ3jFStJhjVkLXq
	WfxNwZym4pIno305wvERcUlH7d1qPif1c/aqAfx7dqRBX/ldpn7ITX+GAh9q+qFzyBDSchQoffu
	KZUTdPKaNnPccgkWB/hOitRPfwd+PcvrSJcO8BkMEsBh3fFl+i2s8+M9CHjQZ+M9LuMwKGh+sQ4
	4oWD2VQNoOyH/XXNmg61lKW8ouAPjEkuJiVs9KaBDNL/ZqVzSPtX+bxDo3ZHtsRts2QeyYiUveQ
	0DOV7PlUt8xHHV3zbjd0xalCsCE=
X-Received: by 2002:a17:90b:3d81:b0:35f:b647:d98a with SMTP id
 98e67ed59e1d1-37dfa1d3fdemr5625529a91.5.1782466624154; Fri, 26 Jun 2026
 02:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-13-phucduc.bui@gmail.com>
 <9a31d81e-5656-4525-b5c0-89b02f179cc8@opensource.cirrus.com>
In-Reply-To: <9a31d81e-5656-4525-b5c0-89b02f179cc8@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 26 Jun 2026 16:36:52 +0700
X-Gm-Features: AVVi8CcOicQMwfYGu0k3_RwjtDGGSW54p-K768oBHJj-nyjVSxC7BUEKxDmUHf0
Message-ID: <CAABR9nHxu4_BkSKC+9qAobgSw4x7XkFz9nVHLKWVi-i+6_Xg2A@mail.gmail.com>
Subject: Re: [PATCH 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> It doesn't look cleaner.
> But anyway,
> Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>

Thanks for the review.

Guards are particularly nice when they can eliminate goto labels and
make the code easier to follow.
In this file, as you pointed out, they don't make much difference.
Even so, I wanted to keep the style consistent across the driver,
so I tried to convert as many suitable cases as possible.

Best regards,
Phuc
