Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39335180A9C
	for <chrome-platform@lists.linux.dev>; Tue, 14 May 2024 19:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715716072; cv=none; b=UkDTDn5LeN+dLoDF7fRkRkqAdDrHvXk26FjHQ6K4OyYIHimrM3BOgTmrydlme7TuaWFcBpUjl4TiULXqScAKpapvDQDgEaFQGZxS2enEOGO/WinAI8/nsqn0nNVX71fyM9NzQ/WuCfjZQ4FUQd/r+479ETI4gimAV3dLAvn+vC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715716072; c=relaxed/simple;
	bh=ABSmZ9mZdFQZsZl4LBMMqD/jP2GT0qD87XXVm6EOlJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZvyKur9SqmMYkSUKN0qEebsJ5Ug3i842/jVIxvcVcKb1FqgSUl1CuJPjOR+bEAYVmgf35HqUnROsPFET3LRLyEx2pphHgqiOSletgqm1K0GrTX9CF9EcS4uIO6XRVjRI7K9HLcj8lJFVO5k1GKXno93sA2r/8sWlKRHvh1vpqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fAFyDMMl; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fAFyDMMl"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4df344eecd7so2059143e0c.3
        for <chrome-platform@lists.linux.dev>; Tue, 14 May 2024 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715716070; x=1716320870; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABSmZ9mZdFQZsZl4LBMMqD/jP2GT0qD87XXVm6EOlJw=;
        b=fAFyDMMlGNbDOfGBTBPE086nOPmZArz1vL2dLWl8Z7GyI6Kn5ZMYGDA6XXgTpuwid6
         hr3T7y6xIrrZuJPVB5R5V83v42zIF4mqNjYV3SttPOWelpDl/MYL+HsUC0y+x1vKG1OA
         suQMnd/Oh6BoGbeQ1s4uKTNxfishfV3hQycCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715716070; x=1716320870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABSmZ9mZdFQZsZl4LBMMqD/jP2GT0qD87XXVm6EOlJw=;
        b=HCcDmQ4cLgiFWxMS00S4rmleHPwHgDti0SsQz/Q/BlAAq6Yj8oGzL8ik8xgHTL+wpD
         yfpGpwER93ukvxKd33pIFbFjbhIpdOjlb0E3mkBWuRbyC2jsOD9eTu7ePP3tDpG7exP8
         FjaFPct4MJEQjJWWGhYPdHIhJOfdehRSBSxrZNqQ2FvgCSEUHra8rtWM1dzUeGvTMDnV
         U6KqUaeCAMOrCd9XwCV0wGqiy/rq7QxgfMaJUV2AxDyl1IolWcugKWY1XvKMIuPdJnO0
         SRhqITyogslizdftDpBrhWmCrqBNnRtD6GR1EJo9JTVn/BgUUSyi4B6DufHVHyGojA4g
         TlaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe0S2VIGMADwt7dy/w9bHZZQs2C4k9e3zkqT2Yh6M3U+KkrVkemO7z6cP9oKhuICY1Fw/axsUiHDImSzBrqPbC7em7X1Ve84c8dw6OCcNq
X-Gm-Message-State: AOJu0YyeSxPUZmPenTlac+jCxRelFaw9D+h10/0mFvk5fnG7GTzLg4zV
	FhOxuezD4wIFG1y2exYGRFPk+egRjdTQ0EX0NTQ1hgC9xQQtTW440FgLb+oHfDolBalmQgt1+iX
	trf8oFzBKi+Qh6sVn6+n4tXO/EGPAdKdv1I8e
X-Google-Smtp-Source: AGHT+IEz89AoI9W1XgpwukhSe7GsfilF8YUEZPTXv0ZQqrCgJjwhHVh7WaxulJ5DCjCeBMB5Ybr2gqP+z6eJw5HdV8E=
X-Received: by 2002:a05:6122:d95:b0:4dc:d7aa:ccf9 with SMTP id
 71dfb90a1353d-4df8834b383mr10770897e0c.12.1715716070068; Tue, 14 May 2024
 12:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240430020924.610724-1-tzungbi@kernel.org>
In-Reply-To: <20240430020924.610724-1-tzungbi@kernel.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 14 May 2024 12:47:38 -0700
Message-ID: <CACeCKacFmhOCzFockyWdp1KaUaQJB3PnU=bbQbUe7yN8Xiib3Q@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: let cros_ec_suspend() call cros_ec_suspend_*
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 7:09=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> After commit 2fbe479c0024 ("platform/chrome: cros_ec: Handle events
> during suspend after resume completion"), cros_ec_resume() starts to
> call cros_ec_resume_early() and cros_ec_resume_complete().
>
> To be neat, let cros_ec_suspend() call cros_ec_suspend_prepare() and
> cros_ec_suspend_late().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
