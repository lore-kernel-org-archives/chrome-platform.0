Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9869152E00
	for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 22:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711579287; cv=none; b=Aeofz+p5KyOaCI0+NzoOi6TaV7ZPINWRU8fpb15aBXJK4heBdNeAqGaMvLTXo9GZgSsB4XZGjvZ18cPYRhBZkUekvzOlj8cI7aF3YjQvjPuA7L0mnfoET5oUCKhHkl00QnmUtva4AfKHj/X3ddBpyAgJLuAOYJji63TY1re68LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711579287; c=relaxed/simple;
	bh=5ThBrSQJKBnrNYoKklFaEy0vcISKtZg0KHuySC8oZ0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjVt1Co/fbq9ZRkerfPj2/oI1n1efJFkfqE5QaSHpp8u0Seq23C7C7SUuSQlOYcWLesh9tCTPVUoNBXIva7l+WF/2lhtdY7Bbs3hCupSiFofWglBVdj67CqbL7yydK+mVUXhnlEjK3xmtMPsfAw8rbvbDY2HAxF0GZz6QXpIj1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mzZFCLlO; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mzZFCLlO"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4765c5905a8so108322137.0
        for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 15:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711579284; x=1712184084; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ThBrSQJKBnrNYoKklFaEy0vcISKtZg0KHuySC8oZ0c=;
        b=mzZFCLlOeqn8bkpFI1Llz+wspTR2j8wWzPI7BdVtoQCm4UrabdAimUTD/6Hx2rJTd0
         wpAJSOLXqEKg0/maDZPojChQx/G57H4AyQ5WLvE6pUQzUxZn5iGdqhGQ4vQ8RAvwpPvJ
         njkQbAnjiCwbCyjId4EFYleASS7yK3ZxsCSSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711579284; x=1712184084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ThBrSQJKBnrNYoKklFaEy0vcISKtZg0KHuySC8oZ0c=;
        b=CZyaBthNBhFRzpSEb03lDWcny8Ok52br1Ou1DZtgTHYgP7O+GSJaniWnDsYvZ6b8ct
         oFrwHGAL7J8lRptkUJRop4tS9KDuatHFkVtBZA0SZ9ytIQ4WunX3bAG9qJdl59SpaFOz
         KTOzf9AHxtV+ed/ehjj12HClYvuKIazKAriw0/5ne2CYkpZdlD/fGvpa/YLMFw/rYsdO
         JfkcGOSdH10EiMhHzJx1RcSQC1im7bYo0Tq+1NQPzBlRv2aXI436KGpUdQuX7T19Ld0i
         igMdFIhwiGcyLOwXgS6K8y5g8yZrj0YcY38FZuy+WTvA89Xv3H3EbIbjmFngLSAV5/Cw
         XyDA==
X-Forwarded-Encrypted: i=1; AJvYcCXuor3zCHEJ00Ll03F8y57QSQIG4FQnvtf/S9m3gFEwe3ZGhsFJppIaxaGFNKXymdbNe+CIYq8rtisDttgrRp/7YsemMUAo1aQwTkqb2pd2
X-Gm-Message-State: AOJu0Yx3Z16aVuIIn+TiZSr4Fce6LxAu13THgFpFhyycPtChz+DpysyB
	uBNGdwsElIItZKCd+3WfMzc1fzCaLPMbzobGdRutnnA/udQeXfPgEzCJzmFBY6trnFB0uyWlmkW
	zMAHFX5LgS+zpB7qZms474LEt2djsnL06UoNu
X-Google-Smtp-Source: AGHT+IHNjjYQGq2X8tle/LZvZCaDTr/ZB2zjC3mCynbSiO5UyriTzUT7hxsMKWXYIiTf3AnTUZQ8LoJQK77rfY27NGw=
X-Received: by 2002:a67:f242:0:b0:478:2f66:f641 with SMTP id
 y2-20020a67f242000000b004782f66f641mr1446935vsm.34.1711579284703; Wed, 27 Mar
 2024 15:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
 <20240325-public-ucsi-h-v2-2-a6d716968bb1@chromium.org> <ZgQBXFzuZLJcmH4h@kuha.fi.intel.com>
In-Reply-To: <ZgQBXFzuZLJcmH4h@kuha.fi.intel.com>
From: Pavan Holla <pholla@chromium.org>
Date: Wed, 27 Mar 2024 15:40:48 -0700
Message-ID: <CAB2FV=7OnNt_-fTzUV1Rrg342jPuh5haUmy=EogVNwyGWyAy0Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] usb: typec: ucsi: Import interface for UCSI transport
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 4:22=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> I'm pretty sure somebody already told you to merge this into 1/3, so
> why haven't you done that?

v2 was uploaded a few minutes after v1, and only added a few
maintainers of drivers/platform/chrome to the email chain. I was asked
to merge commits after uploading the last version (v2). In hindsight,
I could have waited for a review on v1, or added new email recipients
in a reply to v1.

I am working on some comments from an internal review for commit 3/3,
after which I will upload v3.

Thanks,
Pavan
