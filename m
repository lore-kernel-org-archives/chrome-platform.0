Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3F23385A3
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 03:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771818675; cv=none; b=Gu74xS7guIFXsBDG3WZS8enkDlOd/1Cu6MfLQBHuAUYkAyVeg8a6mowbI+A8BgKKpgos7WAFmnhMAmDYEVZcFhItQx1bHMPFDDpJivOsGFpr9tivJUC1TO05BMTKWtkWVk3e5Jz8xtjzZ/BOV5TwS/ryIsezqMZ5V7IiQczygvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771818675; c=relaxed/simple;
	bh=9TBG4KJWUkto8xndWZTre4mHkMZaycGfjsH3VaLQrFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njMww9m9zQoUFWqOfp2bYBa3feh5eUb9klgLoMD9KQ/aAgv2Y1QsKSw8NpOyhHA2odXamfTm6H0hSjP2U8pwHMRENA7IZr53BYGN7rb5xKsa+d8OXDMyPa8l1FOphd8f226L820xn8kdrikjEqSK0ZkOk/LHvl/LHMMC0TeLLl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5g/dQI6; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5g/dQI6"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2baa6ec5638so1637580eec.0
        for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 19:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771818674; x=1772423474; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YXpc3Kmvnut3VwP6NNidiPJA7ThQhlqteukIsGvSTQ0=;
        b=g5g/dQI6kzF+9n7eMHivIJVVo8xVYfk2PXsngLfLJ3huh0H3B/9TTTAVTkeWqoENqL
         tzn3DCf0T++6VfwK+xfQEiWYnHsBjMKe0EAkLDTU86CqS2YLN51bGRg554a45Nm8im5h
         I4IrKttxTfEYa04epXShyMk2PSJntAz9W1o8c5KEgH6AfpIWjRpm38/waZK60phsYnP0
         2SD2dVCI0tWJl9t41Kk1OuZ90awNF8gqibm8V09gty6Vfdyn1EWbPwXConlCOUZ40aGO
         7ziXavPlT7eP5JMdv2k6FTjrPGGZkjxQVuE3SR2YO8rlzBBMWkybDsksRt6rdjZTg5t4
         m4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771818674; x=1772423474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXpc3Kmvnut3VwP6NNidiPJA7ThQhlqteukIsGvSTQ0=;
        b=eOAEcpKrnciFXDUapqWtGQ77KK7TxRfOKdET7eXS1ZOeR1IgjWYuGejpq2Kc44lDMG
         Bqp0GfatdkZ1Q5BVFtzadpYpb0eGwX+TArqGp+Bh2Kk//vDGX93y7UMsV2l1bTVBfezf
         O9a5CFAQ+4Gvz4gfQ8kQdYlFUMq23LlC4+wHW5+kIaDLdobxtcbJq5zo7zKNslJ4Qvqv
         da5VUE77UOmDpw9ciQNB5i5oJi06rijZ25xNfCuYCgXFDYDmdS7ZzEcA4ARjp7guMOqS
         70Zsug4Luj6g7FiBljoRQy0+QJaD0uU8c0TUho1+ptGIsnIZg/oEVxWf1sCF3I3HBdE8
         PjDw==
X-Forwarded-Encrypted: i=1; AJvYcCVtYRjsNHY6HROJ5s+PaYjqMI2/IkVFjZDIzwh2AAntAPw+N5wyLwMiGq9eBRaATzHsOHddyjJn8AuHGe5k/qg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpWJr+aHpukCsVaE6Ka4nIClFraLb8uKGepoFiFG7kNnOmm5gR
	KG769twM0hcqJFiS2hIB17tR6s3ZqLtaE+wnIoJqMTTkROKq39/xfdPI
X-Gm-Gg: AZuq6aI17am1/fPStJ3a+/wok18KVOFk/8kh2i1Keq3TmdmRKVtnhJuXOgvLxj9WUfS
	v0RAbvDtAdtcOX0fiKs6m8v3ao0ZdSp+N287WTwKRZPf7lldmRWBXRk71S64zDLCby0/a6QbJrk
	N3YFSacNG02q7ENS8NNByhPW39AkRymT+/8ItH72x/7DjvwZ8O+xaATl7XB4QK/0BH9nAxKSuG4
	7GYEVjEw6DW6iFC80/KfTNTw6qOk5arAiaUnRiqzHC5mYx91jITLsRNvisW3CV2QIZNPrXZHouP
	w+brm65moyGIU4wAJrWIZR3xY7mDpn7SlCgc5gDYJ/V2u5h5A7NkTvTvuk3I+y/gLZnFsoAD6sE
	iuKTINwu0SWzXSIs7+zaBoPQmwCzSMJoiVJHLDgHnqtihw9PxMF5Ss49asgPyu1f/J6IMWEPR2t
	eXTJDdp/T7Ngx9Z0iXuD+6W9nVXBX4z4a9YcUjEm4OtrWtQG8KjFVGZ5WzxwTdURo=
X-Received: by 2002:a05:693c:3618:b0:2b6:f13c:8d58 with SMTP id 5a478bee46e88-2bd608405f2mr5499375eec.20.1771818673826;
        Sun, 22 Feb 2026 19:51:13 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c6c:6cca:170e:c77b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da3eefasm4173867eec.5.2026.02.22.19.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 19:51:13 -0800 (PST)
Date: Sun, 22 Feb 2026 19:51:10 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] Input: cros_ec_keyb - factor out column processing
Message-ID: <aZvOcaGq3VAVV2Oh@google.com>
References: <20260222003717.471977-1-dmitry.torokhov@gmail.com>
 <20260222003717.471977-7-dmitry.torokhov@gmail.com>
 <aZre8rWDvVDZ_T6p@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZre8rWDvVDZ_T6p@tzungbi-laptop>

On Sun, Feb 22, 2026 at 06:48:18PM +0800, Tzung-Bi Shih wrote:
> On Sat, Feb 21, 2026 at 04:37:15PM -0800, Dmitry Torokhov wrote:
> > +static void cros_ec_keyy_process_col(struct cros_ec_keyb *ckdev, int col,
> > +				     u8 col_state, u8 changed)
> 
> What does the second 'y' of keyy stand for?

It was supposed to be "keyb", I'll fix it before applying.

> 
> > +{
> > +	for (int row = 0; row < ckdev->rows; row++) {
> > +		if (changed & BIT(row)) {
> 
> Maybe
> 
>     if ((changed & BIT(row)) == 0)
>         continue;
> or
>     if (~changed & BIT(row))
>         continue;
> or
>     if (!test_bit(row, &changed))
>         continue;
> 
> to save an indent level.

I do not think indent is too deep here so we can't spare one level...

Thanks.

-- 
Dmitry
