Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72DF3921D7
	for <chrome-platform@lists.linux.dev>; Thu, 16 Apr 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331615; cv=pass; b=RwWJmN4Bo2+VJW+0derqOFWvOVAWey8kRVJOymhz3gtyBmZfzdyNllBO5A/hnzoeZfct7vdfWAVtJot3di0elc4pPDcrejRoRWFH1nkSKAJMuPROWmF/U/N4P/hFtfhnqL0c4Pf5rBBQGHB7WMVvq/sTsxKiZwMvpujHwcRND4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331615; c=relaxed/simple;
	bh=lepRdiQn9/eZXEMWuI5dqLJ/MiRv1qjPyxgCY3ndUqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+ZC4VX1xRPX1lzXOP7PBo7JyBJPAXm8fNcrGBN/YNvMSvlgScM32flKP/9GL+exaFw6f8kVHIkxV7vnF2uuW1L9PxeCrxKLdJzmKhOtfdAsv9+UF01CGyH+yA7hGgr1e6WE89Hf9jGtM/+NkrbF09V50s4KBSCCJ/C0sff+dXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMFq9TX7; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMFq9TX7"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6501c4857b2so5204002d50.3
        for <chrome-platform@lists.linux.dev>; Thu, 16 Apr 2026 02:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776331613; cv=none;
        d=google.com; s=arc-20240605;
        b=FaL44sgyCPjHaP4CZcaFbsxxCoLXc0shHsQ7Hm9nHF+H+oQBZw7X4/YUJjARBNgEE1
         ECNNs/m9fbEWwNcjS1bBsTO0OxLOtQMD/+2HyRWPNeyTD4/dJ1FXGU9iSx0g8TnIr56g
         NRyiMcUsIj8wN92KYBzgSM5TxCGv9qleTOeBZfwHr6fEwU/dHU1q0TdYOddyVPNSQWWo
         2X9z+HGWmYJ8uHhP2U4FM+5e+AVAeXXCry23ANwKlTxbA+oaF8cFyjOLycOg5efRSlGA
         HyUybk0m/ysVV3l0LjVSTSofLKXh9VoIgRpAqdMZ+r0IWVseZnGLmJgn/HFPIDOhohcN
         5v2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lepRdiQn9/eZXEMWuI5dqLJ/MiRv1qjPyxgCY3ndUqU=;
        fh=pLOr52IXOJd6+YdG0q+8KpNrkUJIKyd3engCQypXIZU=;
        b=AA06BYBK63Qgk92cinSBnCDD/N9BgVeefDLk0wXBuXkUSoE4Xa7qAyhS0j7UTbtxot
         IFQ/Uw917Vedg6t4ZOnlw88OM2alHOKnmdvmDGTnhSd374pc90elPc0lcVcwI7T17u3u
         O8fqz2WhDperra9EGwh5BXC6D291kTSRaHhcxWKt9TxlnNmnmxWUQvLi/sIoczRhrOvY
         P4RCl7by3GAmpWveBp5TWARS1Yne/ETZT7NVgpqBRLXI57pQqZvPHKMiMIi+sClnxyPU
         Z0jM5GbL6u6ietxGVFhQb1xfDnjzjIpYOuUXzJERrFl+z13ooR4dZcSvRAP/CZ7UQ0Mw
         kT8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776331613; x=1776936413; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lepRdiQn9/eZXEMWuI5dqLJ/MiRv1qjPyxgCY3ndUqU=;
        b=MMFq9TX7tX2zuC+zOHXVPtqKrLZNK7kCsV8GgnmsssSIjZndqEVh3Ytnu3/zoF6BUi
         GXcyD9onRLNTr3ayMX/lcCc8iJEIKxBXIak29qk6BAMNAoV87+pYXipGLd1b1C2hyPnC
         DaOQF0xx37c7m6CP6Wh3vQgU7ydW2RoRuePmaaOd53rkf82BammDsFVaHavKJQVE+DPI
         rZ24tVOty1xBtL+fpI10jPL7gx153vr5G1ZQjnNBwnyJQpHmm/IpmAJw9C02u+u5Wz6f
         L4qsbSjd6lQdkHECRUzPme3P9HfiXWzUcZJ57xWhwQV47ds4f3uIDnyib8O/5Iq2BXM6
         zNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331613; x=1776936413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lepRdiQn9/eZXEMWuI5dqLJ/MiRv1qjPyxgCY3ndUqU=;
        b=VntG2D6Bv3BFhwkd1LheYDtFNke5VXdjcszLdJ8PyCAHLFfHh71Ei/NE1L0hQInx4G
         MP8TN9Z4IlSWwbYxYqzA3LxybIZY3YpCH6UGuaiJjjKZF5ip7prL3B+6jB8vYiROZo/s
         DSqc9RL7K0+2lwrNUUN83OayNH80YHtGyW49zkH938HiHNmK2fWK6UKjW/aivL6CUqql
         N87qjwdf9POSFWQJR9xkgXBj3eUxU0yuN1AXYd9gL/DuFLeoHjgHrskUw9/MS/UjE0Fy
         CJX3XbgGoTXf0WjQVmFebb/iTKBxSIVhcYWQmpNTkmJOEK+HiXR3KpVf95+vbppqnqH2
         e0VA==
X-Forwarded-Encrypted: i=1; AFNElJ+xlfzLyUvBTcAlGy3ikN35jOpaLyjxRG9sl5kh4o1GKd6niogHO0i+U9u59V6sFckBqLNsIZjMVc2j7VJG1p4=@lists.linux.dev
X-Gm-Message-State: AOJu0YycKuwj69udxEfbQBtsQqaHDyLGyzHsnn6zP7PqrHboX1bcIeIZ
	Xc7i1DMZb3nBg9M3QizdB4tLOOEzvnFBKOXLOUe4GsaXWOXDUM1LssN3D3U5YAIAqiv+Cmj44HW
	dsvhv2sDzPoFGzP5yP1dKHtlvhXVoU4Y=
X-Gm-Gg: AeBDieuGyJ810568LHX8BwpAM1BsTDax/y9hxlFkUposmhQ//iBmj/3q3sQTnUQoDew
	Qp3Qed2J37jLgAdCuHlviMmiBkWxQKENE6ZKCHxRLInBQsemQf8abnRvbwqXk4HC0AM8qGdVNh0
	1h1nWY0184k/tKhpPyeRcfTHvWPI36DLN9jDmi9rUw5nWl7aa+LtRnnElbRFPoGVHmTgqAtPlJ7
	xtiYSqwhzhDE0AhPYsr2HaRJy+E/zhmdi1pQkfZf/DF7EzJCKADHJ31gcTX7QQU7jf6d2Qaf1uD
	wtD0ufqCEN//2jJVqfqX
X-Received: by 2002:a53:4c09:0:b0:650:323f:38ab with SMTP id
 956f58d0204a3-65198b46eb5mr17648238d50.34.1776331612986; Thu, 16 Apr 2026
 02:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415175038.3633384-1-lgs201920130244@gmail.com> <CAOesGMghHi5bEcec9L6d1YUec0Cn5uEs8MrjdoT-zHSr-FJ8pQ@mail.gmail.com>
In-Reply-To: <CAOesGMghHi5bEcec9L6d1YUec0Cn5uEs8MrjdoT-zHSr-FJ8pQ@mail.gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 17:26:38 +0800
X-Gm-Features: AQROBzCqgemqCFHMimaIzwZJyIjw_4UL4YAye85O0rVKaDneU7CcT1Ee7huckxM
Message-ID: <CANUHTR-XcTO4jy_TNe7tHcPPpVh_o_+-hgJtLBxN5MWupcvQ3A@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: fix reference leak on failed device registration
To: Olof Johansson <olof@lixom.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Olof,

Thanks for the review.

On Thu, 16 Apr 2026 at 05:47, Olof Johansson <olof@lixom.net> wrote:
>
>
> This looks like slop to me. It doesn't even compile (there's no local
> 'ret' variable in the function already).

You're right, I missed declaring the local ret variable in this
version, so it does not compile. Sorry for that mistake.

> This is also a no-value fix, the chromeos_ramoops structure is static
> data and not dynamically allocated. Please don't burden maintainers
> with these kinds of "fixes".
>
>
> -Olof

My reasoning was based on the implementation of
platform_device_register(): it calls device_initialize(), but if
platform_device_add() fails, platform_device_register() returns the
error directly without dropping the device reference initialized there.
Based on that, I thought the caller might need to release that
reference.

That said, I understand your point that for this statically defined
chromeos_ramoops device this is not a useful fix.

Thanks,
Guangshuo
