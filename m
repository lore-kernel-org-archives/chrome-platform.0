Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B9F28691
	for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015458; cv=none; b=ROSZK+65TdNQAEkzEU2L2/WLlyhU8wyRzlK/+HH/74YYRXullenfDsqCnwbZOg7JJ6+O3HbrIvx4NvJcSQzaRBqr+9iGsYrBiVnjKal9Y7AlgPBQ8sm/iTAfjfZ+A3NgfQjfeyaT6XB8LPZTFnVHV8VLVt8R5igW6+53PZDyBHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015458; c=relaxed/simple;
	bh=6d/cMzHxJYfxTVbJFM7CFUuaoh2hWWe4To4Wt5P9CNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uACz6c23tMMveRbCbr/+4ZYOuV8ULztzTT6/55O9YYmjnOwwG9pa33OCeAP6uwY/IyXzxeMIGhCe0teU9bDBUfB+GTe9V8EJL/xJwbgK6HMmLMGgOLW7i1jN7TuhxbjYTSew8W5ihuDQKYJU1pJH/12ertDxyLKR3/S1HDubGpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8D817eL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8D817eL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729015457; x=1760551457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6d/cMzHxJYfxTVbJFM7CFUuaoh2hWWe4To4Wt5P9CNI=;
  b=h8D817eLUgFoFQcE82svmxnQX3RsZCSv0wJgvdKCrumq8TbST/q+H4J2
   KCTPk6NsyYu7U6nRyxeBTyzCAhPk2m259nB/06A5QM97LN3q9Gzcq1pi7
   5uM5Iu2bj46/VUWj1FxiMntg/Ez5tKChxfsYm+WCa2UVOUNdeepV4WcgY
   RoI49jngd/2KVvcMgt8TZHfvob2OpbrXvtSTGuo4idzxUSHe1DzaGHy1A
   +g+xubuWJoh0R3mP9JI5c6kXe+areZ3wWJ6cfmtfaiZ+cwgk04+B7qQBO
   ZgHO0kp440NLOTcYTnGq+zKQ7JAAiHKRJQdV1xUo7Sgq2DBOicITIeLW+
   g==;
X-CSE-ConnectionGUID: /NbMOlarSBSeb+HwuEa3WQ==
X-CSE-MsgGUID: aIb2g3e2Q+GtrvMvegd12w==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="16049547"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="16049547"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:04:16 -0700
X-CSE-ConnectionGUID: is6Ub5LHStGlZsxZl094aw==
X-CSE-MsgGUID: kLe7S2OPTkeUNN/dAT6Xxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="78318785"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:04:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0ltx-00000003Tfo-2pDg;
	Tue, 15 Oct 2024 21:04:09 +0300
Date: Tue, 15 Oct 2024 21:04:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 5/8] i2c: of-prober: Add simple helpers for regulator
 support
Message-ID: <Zw6umeIp3l-pfMSb@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-6-wenst@chromium.org>
 <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 15, 2024 at 10:58:41AM -0700, Doug Anderson wrote:
> On Tue, Oct 8, 2024 at 12:35 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > +/**
> > + * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
> > + * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
> > + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> > + *
> > + * * If a regulator supply was found, disable that regulator and release it.
> 
> nit: was the double "*" starting the line above intentional?

I think so. This is documented in the kernel doc syntax. This gives proper
lists in the rendered document.

-- 
With Best Regards,
Andy Shevchenko


