Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6531B7F4
	for <chrome-platform@lists.linux.dev>; Thu,  4 Apr 2024 19:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712257208; cv=none; b=etAXmdzwVf0RzPefCXmdb9bIDOKp/z4G+9/F1ftwqEubyjYg1CCVN3a7w6L1H7oESxbCCAVeeJpAfWxlgaUAiLnyNQrY5WERV8yEY9A5xwCwoWoNZRNtj7ioifqak/nHTMA6BKJpP0aN9U69wBPzYJCfkpqofR1b0Y9Qg48ObFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712257208; c=relaxed/simple;
	bh=ybEnf4IMvnKQwQfq9ik7FHxFZe9ktLKgX0NYQrVVfrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1drARyrA0cI+8CoSYRqW3dsy9PBLHZDErEd0Pa368ErlyAqKiKEB7L1rwvjGf4Q48/LYyVo5WR2JsjgntltNBrBLWOw8BSK7iMzdPBMffto84lh7b+PYb+MYIt879QChZ6N1EqKDfv4Pj0BpaQcuUJYq5E4KvH2EpbaHLQlu24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b=FW8bjawW; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="FW8bjawW"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso1538581276.1
        for <chrome-platform@lists.linux.dev>; Thu, 04 Apr 2024 12:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1712257205; x=1712862005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybEnf4IMvnKQwQfq9ik7FHxFZe9ktLKgX0NYQrVVfrs=;
        b=FW8bjawWL4ybnDreUFIDEjlux/iwjQ5zfVR+LwpAy4wiaQ31qqiBtEnAczi54n+Byh
         oFcRO373u22vgWa6lKustsc9njM9iUYeJOr4cxalOFA7uhQquEPFl1JU10qZoswgyxtN
         2+2enEp8qOZikXds8kpZ3uGqF0tj1yM3p2ouI3j6KJzXcP1bjlpqAQK0z0qt2pTegrmk
         VwEvs4LG5w/NRKErLDj9lnRSj5VaxAuxrCrdEX5eC2rGIBGTOZzAc6dKCII1pxoPw4wG
         UStUWT3OvJmAfmh0JW/d7emUeggQdTy+7YRoMxDo9XieydE8/+BM4qvNo0Khid5tHm6W
         E3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712257205; x=1712862005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybEnf4IMvnKQwQfq9ik7FHxFZe9ktLKgX0NYQrVVfrs=;
        b=imDaNyfGaukKqJXSiWzcOPiW/1ceaSY91Z3JApelTqCyQCXQcX7hD8xNwTxn14lycu
         BM6u0y+JV8LfKlVmXfzbvubFgjU2JTEMALV50oX6FGc378KheilNZlzNK52YdPF8vVly
         PL+jU614MyNrFcHMUi40hF+++z1JWiYea4IYyBWg+tssD1zk2caldqxuDqq9D40RN3R2
         d0RbF+sTUFrLDaSR2EQ2eOkbXOXt7r8v3MsAn19dyd7OobqXom4hfoab+nmpTzcIO4J5
         dgY+a1x4S/vRpZldllB820LN+wbhqN3p7/KhIb0RGaunlblH92WQE0ksbWFUENacr/GW
         CqaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGrnwAIuq8UbWl2p6+9yRB7XIueUlxKQj9twf7S0HI/L9ePxwhSqxK1hkZSzgBecoBWbqAeQEw1Yj5TcOmgPw+CrayONHVRZR3l6A4/tTe
X-Gm-Message-State: AOJu0YyL0OJr9zfbElNC0oxUBWRleU1mUiwUQfdlzW4mrjGnl2c+byku
	wyfVZ8nFlBVki+ONlHVQyaNU1q8ue1Pj/sRkMFh5m+IzY+MW12UuGyZj6hKp3EWhDPYctgBBgf4
	E4/rBtf/wixMr3k5hWnxTO5VeCTTDbL490wgxBMCFMSVHNSw=
X-Google-Smtp-Source: AGHT+IFAQGVUFwK/ed8OTJaobI+Fij9iOmzTwe1jjFFs7Jbyw7wHPNhAQXpY+luxv9VNY2gJwG5D3cbYP2n6LGaUbN0=
X-Received: by 2002:a81:83c4:0:b0:615:1691:14e6 with SMTP id
 t187-20020a8183c4000000b00615169114e6mr3516844ywf.41.1712257205075; Thu, 04
 Apr 2024 12:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231126192452.97824-1-dustin@howett.net> <20240403004713.130365-1-dustin@howett.net>
 <2fba7925-f22a-4ea9-9368-57e50d2bddda@t-8ch.de>
In-Reply-To: <2fba7925-f22a-4ea9-9368-57e50d2bddda@t-8ch.de>
From: Dustin Howett <dustin@howett.net>
Date: Thu, 4 Apr 2024 13:59:53 -0500
Message-ID: <CA+BfgNJrfP7H_10r+DLWrjwhkqd==3czhUaH8uC25971aEpMJw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] platform/chrome: cros_ec_lpc: add support for AMD
 Framework Laptops
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 1:53=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> On 2024-04-02 19:47:09-0500, Dustin L. Howett wrote:
> > This patch series adds support for the AMD models of the Framework
>
> For me this works with todays 3.0.5 firmware.

Thank you for testing! I've been seeing an issue where this
module--even with these fixes--is not being loaded with the right DMI
match table when it is automatically detected on boot.

My running theory is that it is matching the less-specific entry for
"Framework" + "Laptop" with no quirks.
I've been looking into making the matches more specific for all
Framework laptops, to future proof this change as well as make it work
properly via automatic loading.

>
> For the series:
>
> Reviewed-and-tested-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Thanks!

I wouldn't land this changeset until after we can diagnose the load on
boot issue.

>
>
> Note:
> For new revisions it makes sense to Cc people who interacted with
> the previous ones. They are likely to have an interest and provide
> feedback.
> I only saw this by accident.

I'm sorry about that. I'll keep it in mind for the future. I also
think I messed up by replying to the v2 thread with the v3 series, as
I realize I have not seen anybody else do this. :)

d
