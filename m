Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4F6A54
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661242651; x=1692778651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FFUrJBNMDk4t826TIAG649CcdossiWD3s3+Wk/wmhH4=;
  b=DCETRJkdwELydhth5dFQe0nW55iNUH7xUTT0XXFKnG3qfXWcKQisM+qD
   QSi4rh+6il9l/wx63ZPvm/vfe0Evtp6mdMnWIRJnGrF5m/NfibmUC4NqF
   VW6eEEwazZe4eRFT/9odTWJ0EqkhF2ajhKRAfY5SKDcVd3YJ0nRrS3Gk+
   lAmAxxPSRFt0EEqyEvNNw9tLUVZlJMqNKUf5mfGkfnd+Aniix70Jpt/OE
   3848VY5Dx0HaNFTF1+WTa9hRFbcJR8Y8YhmhuUUYbDa7VVPQ7HRJag+xs
   hvUfmZsHaStt3o9wvu55IZ7c2J6l9BZmBuI8trV94oyJDsAyMrwT/RrCI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294908045"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="294908045"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 01:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="751606026"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 23 Aug 2022 01:17:12 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 23 Aug 2022 11:17:12 +0300
Date: Tue, 23 Aug 2022 11:17:12 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH 3/4] platform/chrome: cros_ec_typec: Stash port driver
 info
Message-ID: <YwSNCFt48Q9Eo02I@kuha.fi.intel.com>
References: <20220819190807.1275937-1-pmalani@chromium.org>
 <20220819190807.1275937-4-pmalani@chromium.org>
 <YwRa/QxA/RRtxU3P@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwRa/QxA/RRtxU3P@google.com>

On Tue, Aug 23, 2022 at 04:43:41AM +0000, Tzung-Bi Shih wrote:
> On Fri, Aug 19, 2022 at 07:08:04PM +0000, Prashant Malani wrote:
> > Stash port number and a pointer to the driver-specific struct in the
> > local Type-C port struct.
> > 
> > These can be useful to the port driver to figure out how to communicate
> > with the ChromeOS EC when an altmode driver related callback is invoked
> > from the Type-C class code.
> 
> The patch looks good to me.  But I would suggest to send it in later series
> that uses the driver-specific struct (e.g. in altmode driver related callbacks)
> to make the usage clear.

I agree.

thanks,

-- 
heikki
