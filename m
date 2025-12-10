Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036272ED84C
	for <chrome-platform@lists.linux.dev>; Wed, 10 Dec 2025 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765358201; cv=none; b=YnCu2lUZAhiNC4Zr8h/GbRGli+8qaEv6RH+YW7xQzzQWGSOMYXVR3vpIYSmrmzdEsRP0A8bKZe2Osdu6BoMTO2TYLfSnwyB24x9c18XnNpVefsHa0EbSdZp1IyAlFQFdUQhkw+eOQC3yIcpBBQbuy/INqYewLO5fvS1iuL8vai8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765358201; c=relaxed/simple;
	bh=mMeglKXr1y95udnLZbB2DRU8LoPBn2+zFpGB0mu+WPU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rgkRqM+sy5nrzuFgalaKcmcrQoMG3E873hFjCkYmM6R6TuoLVs8gtJOMuzdPiP3u8m4c7Ibwdu6mt1sMU6Lmql2CK2K8IQOc2CFKAt2+k9LwxGmQcIuXlY6XUb9CxCtCQnzaiJBbsxPtD6Du1w8jbUAvShqlG0X0RZ2ux5X2Y+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhWPJOhj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhWPJOhj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2d52c24dso3573941f8f.1
        for <chrome-platform@lists.linux.dev>; Wed, 10 Dec 2025 01:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765358198; x=1765962998; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mMeglKXr1y95udnLZbB2DRU8LoPBn2+zFpGB0mu+WPU=;
        b=bhWPJOhjOFZV+q7H0Mff0EyHo3GP5FGDqiLvc3mY3xbYRz26sGvbZSkoCiAXFCa4u9
         Bn1EdkysRYmrhX7+JIndfCjfCEBsWYRaipGUg743y7td5acjJP6ooYwo3ai4RIjTRDni
         1Hk46AWF05fyzgfynkIdI6fsh9xkrQNvcnmabp16PrimX223FZAMGhwDFR9arao4nb1S
         pcCXmLe1ROGiP/Y1zWHAaOAqu0qxN9ktsyJGJ10JOeIY1m7AOWYyOaska1WA9uV4GFOt
         ZxbFkWQ+sT1aU77fO6/zWedXQ1eC6IfrMNzXnw1J0VKcw74mA3xOwTSBz+vOL/7lKEti
         6GJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765358198; x=1765962998;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMeglKXr1y95udnLZbB2DRU8LoPBn2+zFpGB0mu+WPU=;
        b=fiRmC1ZmcwJvXspphaqTaU+NpQmZFFFULonWfW7rYKsg06jbFtea3gaHFRmBAa+upW
         TuidMr9OsNnYuPADPhPXs9RA6chmXdvtZGsQw5IcM6XRQs8u4RK3V2+Wq95k4bNWMxFh
         GBF1PzK4b6an+8ySPqbk/XXQXkiciYPoLGeasZzkxeOl+W0ShY4DgIRwr+A2nG/MDJkF
         vi9DczRLkbci5t+KOBEQFXCTQRZkaZyTQYeey+CXMkGgp+Hgp3YZI1EPBC9B9DlwOj5x
         qwBOWRHZvFlGanfdG1jUzPtAhxYwA4oZESlYWCvjDlyGaTszpyr4Epx/UL2NNNtnz0R3
         uM2g==
X-Forwarded-Encrypted: i=1; AJvYcCW5KqkFC1U548WREZfOMo5X1AhtZHMWbiLfnDf7N9gdnq2btpL0Zv9av6d1g0kbvJ1X1wuuk0YDHGjref+00Ac=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrLRhDiISQxVUvla7impAsW82A+TSSxsyUog2dmMIELkuQPfP3
	0SJcgTwt66ilt6HdpP3sfIAwRa53ZLm5mGCdgQOMvTQZ+mz7WtmxvrC2
X-Gm-Gg: AY/fxX5QPtZzGULiMLpekP/4QNCuLtkaMFbhlqH84+iWBtONh5AJcTf2YtbjbX439Gc
	OoMSe4dnqo/cpgMiLjJiusHn/oWuXOpzXmdXVWwdiW89Tv6HXXr/eVRcH1IyzJFHlZPTJq+vO2z
	Mcy5JwOMb/Lfri8zgpTpA046+Hu4FLtextD7m63n4J6Xok0GqlsLb0SgBAzj/e6JmC29UX1VIHM
	IymUAIzGvVlRd87n04YFNjwAujDbUyOuGn4cNRtxRrz7CEHBtLp4Vnycc5qPz2m09ir/Nn2J/cB
	cyn/s1t5i/OsXNS71aaVfZ0do7gchVCmL43MGOT9LjZKMNnjd8Tj5pBNFCMbN9q7p7fIduBcuBw
	zasvGXNAptiVtPy08mTGQAq4paF6xhrA3RfXpN9OHUx1oyXmerNrziYfZH0diAgZ0K9KtkU8U/T
	jzWD3MZj9/Y3Gy9G0ivzE=
X-Google-Smtp-Source: AGHT+IGGphhsdBPpYhuUVQaCWeznKoajx6lTjqKTOyeVxnajYYCGXFRHOAHFacuC5Hrwgx4Mdp9lCA==
X-Received: by 2002:a05:6000:2410:b0:429:d725:410c with SMTP id ffacd0b85a97d-42fa3b186f0mr1564102f8f.44.1765358197942;
        Wed, 10 Dec 2025 01:16:37 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331aeasm36386052f8f.37.2025.12.10.01.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 01:16:37 -0800 (PST)
Message-ID: <8f24bb46e02a6bec6267430d0f0742c601af9aed.camel@gmail.com>
Subject: Re: [PATCH RFC 0/6] iio: core: Introduce cleanup.h support for mode
 locks
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>,  Lars-Peter Clausen	 <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Benson Leung
 <bleung@chromium.org>, Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Gwendal Grignou	 <gwendal@chromium.org>, Shrikant Raskar
 <raskar.shree97@gmail.com>,  Per-Daniel Olsson <perdaniel.olsson@axis.com>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko	
 <andy@kernel.org>, Guenter Roeck <groeck@chromium.org>, Jonathan Cameron	
 <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Date: Wed, 10 Dec 2025 09:17:17 +0000
In-Reply-To: <7aeab2a4-72d9-452f-af86-1e44d5133b67@baylibre.com>
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
	 <77ca77847511e67066a150096a7af2fb84f1f25f.camel@gmail.com>
	 <CAHp75VdNjqZdy0+aSbBzn9CwEwHUhjwED+KRVqkdOMc_N+nX9w@mail.gmail.com>
	 <20251206184645.51099254@jic23-huawei>
	 <54483083c42cf7500239ebb7c0d32d25f11bb02f.camel@gmail.com>
	 <7aeab2a4-72d9-452f-af86-1e44d5133b67@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-12-09 at 11:05 -0600, David Lechner wrote:
> On 12/9/25 4:34 AM, Nuno S=C3=A1 wrote:
> > On Sat, 2025-12-06 at 18:46 +0000, Jonathan Cameron wrote:
> > > On Thu, 4 Dec 2025 17:07:28 +0200
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > >=20
> > > > On Thu, Dec 4, 2025 at 4:35=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gm=
ail.com> wrote:
> > > > > On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote:=C2=A0=20
> > > > > >=20
> > > > > > In a recent driver review discussion [1], Andy Shevchenko sugge=
sted we
> > > > > > add cleanup.h support for the lock API:
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio_device_claim_{direct,buffer_=
mode}().=C2=A0=20
> > > > >=20
> > > > > We already went this patch and then reverted it. I guess before w=
e did not had
> > > > > ACQUIRE() and ACQUIRE_ERR() but I'm not sure that makes it much b=
etter. Looking at the
> > > > > last two patches on how we are handling the buffer mode stuff, I'=
m really not convinced...
> > > > >=20
> > > > > Also, I have doubts sparse can keep up with the __cleanup stuff s=
o I'm not sure the
> > > > > annotations much make sense if we go down this path. Unless we wa=
nt to use both
> > > > > approaches which is also questionable.=C2=A0=20
> > > >=20
> > > > This, indeed, needs a (broader) discussion and I appreciate that Ku=
rt
> > > > sent this RFC. Jonathan, what's your thoughts?
> > >=20
> > > I was pretty heavily involved in discussions around ACQUIRE() and it'=
s use
> > > in CXL and runtime PM (though that's still evolving with Rafael tryin=
g
> > > to improve the syntax a little).=C2=A0 As you might guess I did have =
this use
> > > in mind during those discussions.
> > >=20
> > > As far as I know by avoiding the for loop complexity of the previous
> > > try we made and looking (under the hood) like guard() it should be mu=
ch
> > > easier and safer to use.=C2=A0 Looking at this was on my list, so I'm=
 very happy
> > > to see this series from Kurt exploring how it would be done.
> > >=20
> > > Sparse wise there is no support for now for any of the cleanup.h magi=
c
> > > other than ignoring it.=C2=A0 That doesn't bother me that much though=
 as these
> > > macros create more or less hidden local variables that are hard to me=
ss
> > > with in incorrect ways.
> > >=20
> > > So in general I'm very much in favour of this for same reasons I jump=
ed
> > > in last time (which turned out to be premature!)
> > >=20
> > > This will be particularly useful in avoiding the need for helper func=
tions
> > > in otherwise simple code flows.
> > >=20
> >=20
> > Ok, it seems we are going down the path to introduce this again. I do a=
gree the new ACQUIRE()
> > macros make things better (btw, I would be in favor of something simila=
r to pm runtime). Though
> > I'm still a bit worried about the device lock helper (the iio_device_cl=
aim one). We went through
> > some significant work in order to make mlock private (given historical =
abuse of it) and this
> > is basically making it public again. So I would like to either think a =
bit harder to see if we
> > can avoid it or just keep the code in patches 5 and 6 as is (even thoug=
h the dance in there is
> > really not pretty).
> >=20
> > At the very least I would like to see a big, fat comment stating that l=
ock is not to be randomly
> > used by drivers to protect their own internal data structures and state=
.
> >=20
> > - Nuno S=C3=A1
>=20
> Due to the way that conditional guards only extend regular guards, I don'=
t
> think there is a way to not expose the basic mlock wrapper. So "don't use=
 this
> unless you really know what you are doing" docs seem like the best option=
.

Right! I figured my first option would be very unlikely... But for the comm=
ent I hope we can
elaborate a bit more. Like "don't use this lock to protect your own driver =
state/data ... you might
need this together iio_buffer_enabled() and if for some reason you cannot u=
se the claim helpers).

- Nuno S=C3=A1


