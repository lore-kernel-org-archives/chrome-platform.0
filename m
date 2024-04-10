Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE550168DC
	for <chrome-platform@lists.linux.dev>; Wed, 10 Apr 2024 22:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712787286; cv=none; b=ifYJNKQuDzcSVx/5rq7bGg62LcSG3RdR+D/M3+rKEC8qCIacnZ2NkL42tSDTpz4c67bfxZoyOEtWujA7p3hdYHwEXQP5u3kQ2WehARYzizo68WKW6hahp8SwTxbLJ7V7FftqKcd888rFFIlkUwqD9d/HZjRbtJQ99QuntQELij8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712787286; c=relaxed/simple;
	bh=d/PZVCXIhGvDMuyWk0WrFuAP3smrj3JCHcEtray0wQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJbjuaP2GbLs2O/y50oyKBuLspUODwAiK8bQnw50SOb2FJJP1Wsnq+FW7E3X217VUS3jxFp2cFXjix5mSxljsAy4ffDa/4qtThJ+8DLF4tVo3IfQVji/qmWdPR+6ZK1F6iU3qKMtr7A2M/fVY1/P4eabN7jbgckWetvGt+IItRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BrHQo1hf; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BrHQo1hf"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-479cc1791bfso2206546137.3
        for <chrome-platform@lists.linux.dev>; Wed, 10 Apr 2024 15:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712787284; x=1713392084; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d/PZVCXIhGvDMuyWk0WrFuAP3smrj3JCHcEtray0wQ8=;
        b=BrHQo1hf8uY7ETcFf3JQ5iO3priYnnE+Jax01o0rP+2QLSDlRSk49N8TzP9o1QxZCl
         INrD/zywI4Oy4KoVfqIhXSQe3jxvSCHXeaRK9Hy7gBIEBa0MraWVmo1AZkrMLzQOEpwm
         uG6q1CkFM2IuI2vY8qulCeO1x7QsnhoOW/uxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712787284; x=1713392084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/PZVCXIhGvDMuyWk0WrFuAP3smrj3JCHcEtray0wQ8=;
        b=Yn+nN7TAt8Xx45zxh/9D2VawXpuOlJjt1s7mG4elZc99xFm3VS/kl75CtVpxcHBxBz
         sCBe4S/4n+dFsVWnUk4CbtDA/evdDSm5pYlrpD2XJd/X4Drt2UwL7xhxwTpxeHN+hLUL
         VRhMXoxLweTM6Opvnx8RHZEKAKvgmSTD+gP9Yhm7XlvMBFnw1QXL9MKUUFJpGBR3+deq
         JXnSzirOOXaKp1LTUcWH0Cpjv9Hj4Nr6jQzliPmAWESvho6jXoFtkPnOi04h1KH6uevr
         BaaOuERzP1A8wwUpKNUwvDr5QkMMiaxyGtIvE+Cyqica2jhHorq4Mq+PepIa4RfMAEjG
         JdSw==
X-Forwarded-Encrypted: i=1; AJvYcCUIOpQUmthZI4FjcKDslhPfXbMM/CYDPInWcPfMfyU5B54nifHdO2YEg5uj2BrJ8b3g/3NIaao3PYqcNS+kbTFo25T9S+p7TPuBFe2IrtRm
X-Gm-Message-State: AOJu0YyotwjpXB50f1uAawV+rmV2ABlel31DZtnaUGK1smelrYQuNAAX
	Yoogi3epiRNbX70+0ztdaLpU4NaAdO6Gu0su21HdSEwMXLGmciWvbUn0X12w6PMCgyvo/dUGHDL
	fIuugKIljVybdaufUlWxp0I3FIrplaR6TWty5
X-Google-Smtp-Source: AGHT+IFrChd80DZF7LJFx4Xkr2ghYzNtJ/zfR0j7guxDmH4LX1rsmKz3kvZDB9H/NExqbeD9Jxe5T1Yp+TSqQ6v4FcA=
X-Received: by 2002:a05:6102:370a:b0:47a:26ed:8483 with SMTP id
 s10-20020a056102370a00b0047a26ed8483mr2845023vst.14.1712787283771; Wed, 10
 Apr 2024 15:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240409-public-ucsi-h-v4-0-e770735222a2@chromium.org>
 <20240409-public-ucsi-h-v4-2-e770735222a2@chromium.org> <ZhUcu1k0Cum-IMVQ@google.com>
In-Reply-To: <ZhUcu1k0Cum-IMVQ@google.com>
From: Pavan Holla <pholla@chromium.org>
Date: Wed, 10 Apr 2024 15:14:07 -0700
Message-ID: <CAB2FV=7PWffxLR9yVq2MbVijEesSavKiXFT9ZKwJzDi3SnPQyQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ack to all comments.
I plan to upload the next version after related EC changes land.
