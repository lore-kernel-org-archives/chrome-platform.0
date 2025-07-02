Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6544B23E32B
	for <chrome-platform@lists.linux.dev>; Wed,  2 Jul 2025 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461114; cv=none; b=EEWrN/fp8U5iRPKtwVcD7a+9Rf+y5lUegff0cKKZX7J4Ly5KPngI2e17YpbvNNBcuOr5oyFTqn/emxusX3dJY0v0gPWxIoZH42To0a/AGa4MHXIlvBA3URgF/KbBXueRN0CPT59rsmnOaE8HLeQ/HSMR2P9XoN65P73n/4fuU5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461114; c=relaxed/simple;
	bh=wLJ2lOHu7SJWYAnbr7bH25YB93XP7KEYlifhHrYsusQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYWZKoWzRJj3ukm8EICBZ9CIxdLnm2GBxXzG7llBV57RqhjTEFJ8IDLIgHXswu6pvJa2Wkz9FXsJ4Ct6Eg3yno5x+G+DFkQvfWd1qK5bo5yuFG9UoNUgY+Plm2WQWuIimScZZqGEzJgZsMPuW6XdnEz5LiAaiJkRZiY+rsnbxQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D6Ngk86F; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D6Ngk86F"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-71173646662so46693547b3.2
        for <chrome-platform@lists.linux.dev>; Wed, 02 Jul 2025 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751461112; x=1752065912; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SRIqoqvbfDk9YR/sPy7y741GkF0mj9QBQEldHtyNRH8=;
        b=D6Ngk86FFem/5cx9CH5AM8Up7L1QncOwmK8XhET/fUlcHaPTxUtYoIuGcWWBRaG91u
         loUSLQrlRaDc8l8cHgmCywiTY6r30oSKaYhQ0baj2uwVeOe0Vnn26AzZcGr3zZMAEzMV
         TOlJoZoddBaf/1sjWa3BY1C7Lsj/I0TDZLzMjvhWem5HzgBi4XP02IgK4JLUXfOqMpfH
         2UeiVjfIW/WHwD2zjdh+XtbbEfLoyxkRxr5hcPmAU/bZLq9u8S+wjipaGctLdUucRL/m
         5iDdp15XZKjUdMpfqHMI0qs0OYZKJ46m3lHZbeIVglka93cAQfkds/Z5EgvH6edCzEd1
         rshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461112; x=1752065912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRIqoqvbfDk9YR/sPy7y741GkF0mj9QBQEldHtyNRH8=;
        b=OV0QuLbsa+LYlKB6n0I8R/1hMLmCtqIndNpk0WC9AsyXT9FUcoYrvLhu3Th8+LsZN6
         KyClEJGbw+bDVcCO8+V1nDkBoouiXC7AAWPrJL3J7Rh5yRdGMnYu/fzWLSBFxHDZCLD7
         c4RGPh5kGFpQwalT3/qqUlMccI0PFAsXSi3OJFDgo4Xxa9WgI1NGJiGzHd4mbNPVnl/c
         NT5QmW/JdBFSeiT9i5up7cqsJzWufRzkmlNfTBQg+cbLt0AoBKrgGy1Ansk0RU8bCIe2
         fx3PlGdIoq5NuHesG6WrUNHli9RcORCGzlXT46ZJ81bA1g+ez5uHG4+T+GhofHhSiK/K
         gQjg==
X-Forwarded-Encrypted: i=1; AJvYcCXY5ZNPacdc8eXYdG3wjurlt1NvqAH8kk9Z5Dn1LonNPK/eVwYrIjty7e92znOUA111AVOIGRwv74AJA3PG6eM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRQL7uePBbDD2Q+4wbmhPapRmfbDWOmZozqGn3K+j+2ktioHf2
	CrIzuAVtfpkWmjf25DKh0YwbVDAH18RTVj0HXpqjhCHvQCRQZh61ETYRy4SXC9gyBTdM2NtlM7C
	e3tftmm3m08FTmsbUjS+uC7EU21wN90Y1Mwjh7ERg
X-Gm-Gg: ASbGnctwBckKPXIhlYJWpQrHxgF5SsTd1QU/eMDAFEDp7gG6k34LWKWxN6JwFkrvulm
	7JLk1t4Vpx/1QByVOSLX9/VozZpCbtQWzXWMTcbbGefimD9nlwhqtcJ11ydOPhwRJwFN4OErsyx
	B1fRPUlR7ly0KfCfQu3g3teMy6zA+fsioRAdMoMGZW7RCS
X-Google-Smtp-Source: AGHT+IES9yepdlGF69ZNWiFL1/vtA5d8+I7vWDN7lxfsmpwrpBafsM7ggWQxa1AaLLuE2ulmhwdnUj1YzAs2iCghpD4=
X-Received: by 2002:a05:690c:3607:b0:70e:2cba:868c with SMTP id
 00721157ae682-7164d3587dcmr41259897b3.11.1751461112175; Wed, 02 Jul 2025
 05:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250630122155.2060589-1-dawidn@google.com> <202507021809.3gclls4s-lkp@intel.com>
In-Reply-To: <202507021809.3gclls4s-lkp@intel.com>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Wed, 2 Jul 2025 14:58:21 +0200
X-Gm-Features: Ac12FXybBvzfEXfOSH2V6uJ_ja06ZluPvYy7PtAvgnywwBnKjuGFMROtMFqDZ8g
Message-ID: <CAJ_BA_AUphERSksoneVvUm7=Seb0WDAYC-jSkkYDfVe2SYMm=A@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: Add ChromeOS EC USB driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, oe-kbuild-all@lists.linux.dev, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, kernel test robot <lkp@intel.com>, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"

I'll fix the build problem in V3.

I've also found a bug, introduced in V2:
> +               ec_dev->din = devm_kzalloc(ec_dev->dev, ec_dev->din_size, GFP_KERNEL);

ec_dev->dev is not updated at this moment. I'll fix that in V3 as well
