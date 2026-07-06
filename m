Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAF13DEFE2
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jul 2026 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330315; cv=pass; b=RezTaGEv/Wmq3nlM44u7z5XVZnF4TuKnH8p4ux7YrJsCxmarjH8S7lBuaeo+aE+ItwcITwVLrEvKMwPJZm4/FNu6jzaSMPElyOz/85hjige01dRhZjx7UoNIJCgEoKbtGxRiD923mGhKdUc4JSZGIurYHaA7SfvDk/0LilqtZ6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330315; c=relaxed/simple;
	bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skJzi32aXc29U+MNrHPKymkShbDSPxJRFG5f0fcrqv9xiT52DzherF3QlV7AcQPCukUBnRkJWVf8S3GGFc7+0dEk5Jo9b1qVxoYAPZ1+7NLV+QhjMx7fQKXUCf2b04SHI+fZPdD4CzDBr28PRcPQTJBwjN4xRwHGgXHExAdQlBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCoEti43; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCoEti43"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so750569a91.2
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 02:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783330311; cv=none;
        d=google.com; s=arc-20260327;
        b=NyQOdUjjjSOFnckgO7N87qqjG1FyKhYpPSNmCHvkKjiJznErHm3SNNoJGVk5qB4HK3
         6+VYsQdnrXvh7e4XG7B4/zATJ9pjdfT4V/zWxfmCdA9cXEcG6pw1dvBNNZtha7LkXrNm
         Xc0Hnpa4EOaw8GEdZVIQpCDX76261T0/YmHqSUFw5My/gu4UsGfbD7D1niufgqyv8Rxk
         bMx34oVnh7JwlBUx58dGFKweMVITbYGMZfuigmL/SsZ1LocRjNIw22tS7If3ucRjQZQ4
         mLFwAmu2GZ4butAlv0TzBE7vWH0ZclH5yiA9qG20EfFo6locnTBGyos1F2gWNg/vjv16
         /RZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
        fh=wlc0ZwxhbLzyKAOszHhJUnmNEg6QgZpX3Ypj9CQnaeo=;
        b=p+zcFxx0cjJGw7eiM287cv8JFjQan+MXq7QsQDrStz3P3dzSqm2t9UlKUPuWcddTTD
         +luCHOflGhxShQjDiAM+2om6VwGilYGvUSs8xJEROKwm6gKzoAhq2tElz/fM9g4fNLDB
         aFApMWUvZ1DaGFAhCmiO3a+qdIhPLa4hOU31AuXlXfeVrafKx5C0w8cS5Hfj2X1NqF9A
         fcB5HwnBJ/PaLA+eu52cgFwhKGIj0teT58jAuBSxBvFZW/QV8KBfYCr3BBpnzq6dcIlQ
         Be5cQkA1Dp8zVsvPJXw33jH/80SqY5Ou5DuI9stj6Hcq0ECx2slP1DVe+aFcYkpvN8+W
         3QwA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330311; x=1783935111; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
        b=fCoEti43e7yVHbmIqvU9ryhBdeNTKWkoGfU/zigXWYpSJ6hbc1wjSt+lNcd/FV6trJ
         dDnh5o4Uf7gSNi/dRv6SFvzSbZZWs6Qx1loCHz74juOvmVAXKdsdf7fIiOyyDskiByvp
         q1r3MARdut4nbCh0kJkGvjKaCKZSdtqyb/rGhMEGDovE673fhSiXebU6Gg4GK+YA9z+C
         C4f7OCmJqM4EpnC9C/3KPKXWsCmazjp81foe6tok1sMCh04lSksd6pjoZue+GbAwJL3u
         09b6vgvW66XpIyFeBqe8epX71qyyUoiUz+D2+LDnRIqO4HgWXtWrwnYBTKuOd72HwC+1
         HD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330311; x=1783935111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
        b=AL2ZrwDZ4cptxIzu9G8vda66BuZ4hVH4LzGoxCmVLLG7Xj0DwZQIaqe2MO/SCrVmix
         OZmpEUCIU7a+wX3f+v03QwTpPSQGVxsK6vQONIlPak98ndFQ6HtDb9ujtHqCl4firRk+
         iaVbFMI52LWIDqIn15VxiIStOnd8FQ25Sf/+j/13KTB7wUYQtQkOxTzhIumXBjZzXr75
         jHdZZ84lf+NdVThVN3pYYNHmPvrxUGmKpviHX0zSlgK5UOQUZsxaUWKlpohSs3tA1bkV
         9IKidxM+DXhTgL3VBjjLud4xozJJROnL1nMx4yD5+6ZO3YfoBkHGVp52WXpqH3zyaWmP
         u86A==
X-Forwarded-Encrypted: i=1; AHgh+RoQ/czCHmu5MJOyER+foCoUFzltJtBOFPz7UV50falcY+/8TQ0KrXJXRYfkLxSX7aXXqiHiRm/eMoihX0ryiVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyclJhaTlnHhYDyw0N9NwQTjvC6/wAO40cV0DBzN3N93pCvenAX
	w5kn3cHn9wrs+Q81bu3tWu6kx7jmBsWvlm9S4js+6DT1ic2QlsoojwiA5zAVeqnZwPYlU1EZ6mY
	To1JOOqJ149lUT6iiRbmyUbOqPhcuo2U4gsQO
X-Gm-Gg: AfdE7clVcqn72hk4b+QdhP9Nnqz61TVD2bnkxHAwk9IkScCdv+lgsIKTnlDXe7BMsVN
	twrRNuppCwn0/b1h6jsfV6IdEKsueZEhc8O54WoPHbDVZXgNviviaC7OUYOX8l/S2nWvzNKSfLe
	xjjqogap1dAehldnrP0uyYfRpTK9wO42ROlYRzjsiH4eK8fh1hyDh/csVLlaLFtOK6OGeQveikY
	9J8+e443vDo/87qo7nHtZMGiAYYcJWRmhIknNi7ioGvK7Wx5cZuF3G0MSNVlkeHl6ozc6+GnK6E
	rcnozlD4V8Jyelo4Kk2Juj+GkJKA5Hn66+J1ug==
X-Received: by 2002:a17:90b:3b87:b0:36b:77b9:5c8c with SMTP id
 98e67ed59e1d1-38293b99461mr9146796a91.17.1783330309463; Mon, 06 Jul 2026
 02:31:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-14-phucduc.bui@gmail.com>
 <c6bb6d40-d539-4018-82e8-7aadc28b98f5@opensource.cirrus.com>
In-Reply-To: <c6bb6d40-d539-4018-82e8-7aadc28b98f5@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 16:31:36 +0700
X-Gm-Features: AVVi8CcjV27A_4YHtL-aIf5btTq-bmQ7yClBnFPWKFVrjKx_yBqikhyITmOlrqQ
Message-ID: <CAABR9nEx4MCgBJNm-+jYLmAZJLPL-PoOXDwW_yUubHpdZQSJrw@mail.gmail.com>
Subject: Re: [PATCH 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime
 scope helpers
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

Hi Richard,

Thank you for your review.

>
> Should change all the error returns to directly return IRQ_NONE.
> It looks like a bug that it checks rv but returns ret.
>
> The reason for ret was so it could use common exit code to
> pm_runtime_put() and mutex_unlock() for the error and success cases.
> But this isn't needed now.
>
> The local ret variable can be deleted.
>

I sent a v2 a few days ago.
https://lore.kernel.org/all/20260703055355.244898-1-phucduc.bui@gmail.com/
Could you please take a look and review it as well?
If there are any remaining issues, I'll address them and send a v3.

Best regards,
Phuc
